Return-Path: <vkoul@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5BD3EB64D7
	for <soc@archiver.kernel.org>; Wed, 21 Jun 2023 12:38:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 72480C433CD; Wed, 21 Jun 2023 12:38:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C2D2C433C0;
	Wed, 21 Jun 2023 12:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687351095;
	bh=s/qdnTD5K4xkbOKaZkdTYFAnan/FfFnIlgUIS1J3gZk=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=oPeyDH3gb9d62xkd6pbDeuAZlCx8pS9XnkfN0u7vl9NtHaMlnEaZu9NFzIesz6yrc
	 2SKBAWAarBgHbXZqqXUsaPc8qT0Qbw4Kvi9+V9PfneLLPuz9ij06SUY9pRZ4Cdiw+t
	 EcRbu0FovF1P1P42OthSoxKsilECkqxrBrFGPIgReyGxWrcHU6rO4w3M8OM4TeGChm
	 j0Rc2nLMATsDQ8aY7wSGDTbFFzSDUzmKSoL62v5bw2kyT5Oth/jH+1Yje8CRvtj4UF
	 UOP5Y3TeOz5Cm0Y3cAkQRy+4YhB4ECVbxThL8o8rLdbPQKa0RYJRyKBAKdFkMVTlG4
	 d9xgUcUsRxoBg==
Date: Wed, 21 Jun 2023 18:08:11 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Rudraksha Gupta <guptarud@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	soc@kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/4] dt-bindings: phy: qcom,usb-hs-phy: Add compatible
Message-ID: <ZJLvM9aEsx13WjuR@matsya>
References: <20230607050025.86636-1-guptarud@gmail.com>
 <20230607050025.86636-3-guptarud@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230607050025.86636-3-guptarud@gmail.com>

On 07-06-23, 01:00, Rudraksha Gupta wrote:
> Adds qcom,usb-hs-phy-msm8960 compatible

Applied, thanks

-- 
~Vinod
