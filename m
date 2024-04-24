Return-Path: <robh@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4503C07E8E
	for <soc@archiver.kernel.org>; Wed, 24 Apr 2024 18:16:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A0FFBC2BD10; Wed, 24 Apr 2024 18:16:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60E0DC113CD;
	Wed, 24 Apr 2024 18:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713982579;
	bh=KwN5LbLdRITg6/Got4vKHyb2VZlR7IroPUoxp7ttfuc=;
	h=Date:From:To:List-Id:Cc:In-Reply-To:References:Subject:From;
	b=ekyS3O5jQzR5HxRyrn8WfDPh4nhZw0ERkvFdx0qj/HZ9BaH9n4do9C81cZ8AQG9mF
	 dUgjijuS8I4jX4Dc/FPNw3dWGexQJDAhfHUWsz3O+n1jG74BQ+mefe2YjB0cKLjmo/
	 p7I0zat02+2l4ZuLiEkvnl97M6Jraq6FfNORp5aLCeI4Q5jz/EM+g+WtRe+kwSu2Oh
	 X0GXd+JC2y0q4MNybZise9mzIykKEAf5mpP5lPUDE8z89/43m+0MeXjY1/TmURx6Fq
	 5p589c72kIXP9+6YmtQfTntNnTnpy7CIFiu5/NIksc9xM9UMoEGnGC/Kpl+TzM/HEo
	 G84Qs8AclAP0A==
Date: Wed, 24 Apr 2024 13:16:18 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, arm@kernel.org, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 soc@kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Hans de Goede <hdegoede@redhat.com>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>
In-Reply-To: <20240424173809.7214-2-kabel@kernel.org>
References: <20240424173809.7214-1-kabel@kernel.org>
 <20240424173809.7214-2-kabel@kernel.org>
Message-Id: <171398257727.225434.10521944963040550546.robh@kernel.org>
Subject: Re: [PATCH v7 1/9] dt-bindings: arm: add cznic,turris-omnia-mcu
 binding


On Wed, 24 Apr 2024 19:38:00 +0200, Marek Behún wrote:
> Add binding for cznic,turris-omnia-mcu, the device-tree node
> representing the system-controller features provided by the MCU on the
> Turris Omnia router.
> 
> Signed-off-by: Marek Behún <kabel@kernel.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../firmware/cznic,turris-omnia-mcu.yaml      | 86 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/cznic,turris-omnia-mcu.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/firmware/cznic,turris-omnia-mcu.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/arm/cznic,turris-omnia-mcu.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/firmware/cznic,turris-omnia-mcu.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240424173809.7214-2-kabel@kernel.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

