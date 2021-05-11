/*package sit221.marketapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import sit221.marketapp.exceptions.ResourceNotFoundException;
import sit221.marketapp.models.ProductColor;
import sit221.marketapp.repositories.ProductColorRepository;

@RestController
@RequestMapping("/productcolor")
public class ProductColoreRestController{

	@Autowired
	private ProductColorRepository productColorRepository;

	ProductColoreRestController(ProductColorRepository productColoreRepository) {
		this.productColorRepository = productColoreRepository;
	}

	// SELECT ProductColor
	@GetMapping("")
	public List<ProductColor> findAllProductColor() {
		return productColorRepository.findAll();
	}

	// Select productcolor by id
	@GetMapping("/{id}")
	public ResponseEntity<ProductColor> findProductColorByCaseId(@PathVariable(value = "id") Long caseId)
			throws ResourceNotFoundException {
		ProductColor search = productColorRepository.findById(caseId)
				.orElseThrow(() -> new ResourceNotFoundException("[ Not OK ] : The product color id " + caseId + " is not exist. "));
		return ResponseEntity.ok().body(search);
	}

	// Insert product color
	@PostMapping("")
	public ProductColor createProductColor(@RequestBody ProductColor newProductColor) {
		return productColorRepository.save(newProductColor);
	}

	// Update
	@PutMapping("/{id}")
	public ResponseEntity<ProductColor> editProductColor(@RequestBody(required = true) ProductColor newDetails,@PathVariable(value = "id") Long editingId) throws ResourceNotFoundException{
		ProductColor edditing = productColorRepository.findById(editingId).orElseThrow(() -> new ResourceNotFoundException("[ Not OK ] : The product color id " + editingId + " is not exist. "));
		edditing.setId(newDetails.getId());
		edditing.setProductColorCode(newDetails.getProductColorCode());
		final ProductColor updatedProductColor = productColorRepository.save(edditing);
		return ResponseEntity.ok(updatedProductColor);
	}
		
	// Delete
	@DeleteMapping("/{id}")
	public String deleteProductColor(@PathVariable(value = "id") Long removeId) throws ResourceNotFoundException {
		ProductColor removing = productColorRepository.findById(removeId)
				.orElseThrow(() -> new ResourceNotFoundException("[ Not OK ] : The product color id " + removeId + " is not exist. "));
		productColorRepository.deleteById(removing.getProductCaseId());
		return "Ok";
	}

}*/
