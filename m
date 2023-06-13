Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9C6EB64D7
	for <soc@archiver.kernel.org>; Tue, 13 Jun 2023 23:45:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E01DFC433C0; Tue, 13 Jun 2023 23:45:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A504CC433C8;
	Tue, 13 Jun 2023 23:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686699941;
	bh=2jkdPhZImM9+D+figD0v0IHiAIgXVBcYWC3TewoLMZk=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F1W6PenN5VkeE70mUR7U1RtCCxa26O0LNdr7DQBjIyeH5sQ92Xsru4m8R4OMafqr8
	 1PLQwX1vUQuhA4ekWITILW7BwigVzlCGHTDXPuGoV0/AdxycrHBHq+IDF9OuhAcGyx
	 Hsr0xZupqMPqibu6mmer+iBwSWFt1qQg+KYq5LluxlXKNPTiLv/SGVM916TmFMHp7J
	 FJieHzwCYD7KR7gV0vOouenRwQdp11VtZYoTmF0CGvaRBtmRKHASc8sJDb+Ghj2uWL
	 80XD0avmVBr1BWvNzir1eBBk01HtXw6piJhNM8KpydwCE2rrCoHdbp6NwZ+WKjJpMp
	 jqragYFffxm4w==
From: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Andy Gross <agross@kernel.org>,
	soc@kernel.org,
	Rudraksha Gupta <guptarud@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: Re: (subset) [PATCH v5 0/4] Samsung Galaxy Express SGH-I437 Support
Date: Tue, 13 Jun 2023 16:48:45 -0700
Message-Id: <168670013501.1400697.8528617647603360792.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230607050025.86636-1-guptarud@gmail.com>
References: <20230607050025.86636-1-guptarud@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 7 Jun 2023 01:00:19 -0400, Rudraksha Gupta wrote:
> This patch series adds support for the Samsung Galaxy Express SGH-I437.
> Currently the following things work on this phone: UART, eMMC, SD Card, and
> USB.
> 
> version 5:
> - use enum instead of anyOf in qcom,usb-hs-phy.yaml
> 
> [...]

Applied, thanks!

[3/4] ARM: dts: qcom: msm8960: Add USB node
      commit: 80ce22e5cbe705ff2e113890828d44aa0b3ad96f
[4/4] ARM: dts: qcom: Add Samsung Galaxy Express support
      commit: 2b01dda16124696c4b64edcd31e8c2d37c559998

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
