Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90518C636F9
	for <soc@archiver.kernel.org>; Tue,  6 Dec 2022 18:19:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 52F86C433D6; Tue,  6 Dec 2022 18:19:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B3B9C433C1;
	Tue,  6 Dec 2022 18:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670350784;
	bh=9cpRxOzcF+JiwPWEEEjxmWgP0Zwf/VV5Ke4FJodflnQ=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XlO1S7HnKxoXP+CiuVXbT7/nOGu/cpgJ1io0mDTDH0SZOHGkI9m7ILrso+apNz8+Q
	 0amcfNQe21L/1/HexQiUCOH44gcFRij/2mTiDfFTW8RPTdHxCE0bFFDAOirl3bt4BY
	 bWhc1kR+7MkFt05NKWA3c4E1FUu6yYi2SPgcEf7MwYJEbnU0IJfwr/e8viMHLeIyjD
	 t0t6K/pKNa0q/P8HNaBQdhHCKSPPdQtxawhj05q85H/ZmQ2VvwS9nmHqsU+zJaOvo7
	 3ZMcNr+DpNZFPVofE9W3gv1DIAEdlBpUrzrFWFbN1SHVtoTONONZ0a7McdQVI34i+A
	 MyTqi5ukM3zcA==
From: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
To: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bhupesh.sharma@linaro.org,
	soc@kernel.org
Cc: catalin.marinas@arm.com,
	konrad.dybcio@somainline.org,
	linux-kernel@vger.kernel.org,
	me@iskren.info,
	bhupesh.linux@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	agross@kernel.org,
	will@kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm SM6115 / SM4250 GCC and Pinctrl
Date: Tue,  6 Dec 2022 12:18:49 -0600
Message-Id: <167035076347.3155086.2183378357968757238.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221128200834.1776868-1-bhupesh.sharma@linaro.org>
References: <20221128200834.1776868-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 29 Nov 2022 01:38:34 +0530, Bhupesh Sharma wrote:
> Enable the Qualcomm SM6115 / SM4250 TLMM pinctrl and GCC clock drivers.
> They need to be builtin to ensure that the UART is allowed to probe
> before user space needs a console.
> 
> 

Applied, thanks!

[1/1] arm64: defconfig: Enable Qualcomm SM6115 / SM4250 GCC and Pinctrl
      commit: 5d4bf8607be1683b09378ff1dba71cfe3d4ff6ec

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
