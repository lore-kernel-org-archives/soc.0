Return-Path: <robh@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C830BC3DA49
	for <soc@archiver.kernel.org>; Fri,  2 Aug 2024 10:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7A723C4AF0E; Fri,  2 Aug 2024 10:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E96FC32782;
	Fri,  2 Aug 2024 10:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722594556;
	bh=CJCaoWSDIP5SJphz4ctyOagGF1RYe8/tBShRSLTdA+0=;
	h=Date:From:To:List-Id:Cc:In-Reply-To:References:Subject:From;
	b=TAKDI/ZdMZBJxxYq7r51GY2g44cAnqXZXvN1Hs1s7Nwby5EA7bYJUgznB95Rlb/xq
	 8b2/4pSbmtaCRkb9KaXsPGcZ5Rk8fxybxAwiW3+8uGiVUcqqvpZgALQk7w4gthY+DF
	 7HBgVUZDCmzuujMyjF+dCBzBFaCC8vs8U97mWYbHLNXoiV1r4TiJECnzbBg93r0heT
	 zZ5MPq+2TlV5rb9RV9xTWxOjptyqF0uVivg/LQP6Ab8GaH8d+U1tH4G4GloAGKvyrZ
	 Z2fXb96R3AlAcYb2psUgPzqd0/BbTi0m1EdAGw0yWSDmqQcxCo1CGPxS/Oz56j5jyE
	 PYW1C9Zl754jw==
Date: Fri, 02 Aug 2024 04:29:15 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kevin Chen <kevin_chen@aspeedtech.com>
List-Id: <soc.lore.kernel.org>
Cc: krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
 andrew@codeconstruct.com.au, devicetree@vger.kernel.org, sboyd@kernel.org, 
 olof@lixom.net, lee@kernel.org, u-kumar1@ti.com, conor+dt@kernel.org, 
 quic_bjorande@quicinc.com, dmitry.baryshkov@linaro.org, 
 p.zabel@pengutronix.de, linux-aspeed@lists.ozlabs.org, 
 m.szyprowski@samsung.com, nfraprado@collabora.com, arnd@arndb.de, 
 mturquette@baylibre.com, soc@kernel.org, will@kernel.org, 
 geert+renesas@glider.be, catalin.marinas@arm.com, neil.armstrong@linaro.org, 
 linux-clk@vger.kernel.org, shawnguo@kernel.org, joel@jms.id.au, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240802090544.2741206-3-kevin_chen@aspeedtech.com>
References: <20240802090544.2741206-1-kevin_chen@aspeedtech.com>
 <20240802090544.2741206-3-kevin_chen@aspeedtech.com>
Message-Id: <172259455507.2558656.18344933444213909682.robh@kernel.org>
Subject: Re: [PATCH v2 1/9] dt-bindings: mfd: aspeed,ast2x00-scu: Add
 ASPEED AST2700-SCUX schema


On Fri, 02 Aug 2024 17:05:36 +0800, Kevin Chen wrote:
> Add compatible for two SCU of SCU0 and SCU1 in AST2700.
> 
> Signed-off-by: Kevin Chen <kevin_chen@aspeedtech.com>
> ---
>  .../bindings/mfd/aspeed,ast2x00-scu.yaml      | 70 +++++++++++++------
>  1 file changed, 50 insertions(+), 20 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml: 'scu@ast2xx00-scu' is not one of ['$id', '$schema', 'title', 'description', 'examples', 'required', 'allOf', 'anyOf', 'oneOf', 'definitions', '$defs', 'additionalProperties', 'dependencies', 'dependentRequired', 'dependentSchemas', 'patternProperties', 'properties', 'not', 'if', 'then', 'else', 'unevaluatedProperties', 'deprecated', 'maintainers', 'select', '$ref']
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml: 'scu@ast2xx00-scux' is not one of ['$id', '$schema', 'title', 'description', 'examples', 'required', 'allOf', 'anyOf', 'oneOf', 'definitions', '$defs', 'additionalProperties', 'dependencies', 'dependentRequired', 'dependentSchemas', 'patternProperties', 'properties', 'not', 'if', 'then', 'else', 'unevaluatedProperties', 'deprecated', 'maintainers', 'select', '$ref']
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml: scu@ast2xx00-scu: Missing additionalProperties/unevaluatedProperties constraint
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml: scu@ast2xx00-scux: Missing additionalProperties/unevaluatedProperties constraint

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240802090544.2741206-3-kevin_chen@aspeedtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

