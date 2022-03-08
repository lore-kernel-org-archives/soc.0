Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C26C433EF
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 16:45:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DC13BC36AE3; Tue,  8 Mar 2022 16:45:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F81C36AEA;
	Tue,  8 Mar 2022 16:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646757909;
	bh=OgnolV4wOPs2BODJU4a7Au0G1bcQvBMNMWwh948rxXo=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qm5C8562vHrrWfOJMZqpcDWGpB6sZN1/BdaC5kCtbIpbCwrpYS/nL9F2C8lSpyLii
	 5PaR4Ypyfs213BdxPoX27QbkVwGZQl3F83HovjDmgb7Um3Fs+BvtUtFn03072julRc
	 54QYGhbawoGIktf120TwZy7ibrnkcj9VHqh0G/sdK+oBy9QU/ZLEfhFZRXZObNIf8n
	 91sCwpbJ7O6L578h9RFp43PPQKmfFiX5dWETKkKSOKCrWlbkaSLWovS1Z3YH0JlohJ
	 NaVcvXfS4f0uGpIUIVJjHjTFRt6TJXNPO1AqKlF3GSNM2GHoFF07UTd1e64vzarszW
	 CDEfS7UU9HOmw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-msm@vger.kernel.org,
	Ben Wolsieffer <benwolsieffer@gmail.com>,
	Dominik Kobinski <dominikkobinski314@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Luca Weiss <luca@z3ntu.xyz>,
	David Heidelberg <david@ixit.cz>,
	Pavel Kubelun <be.dissent@gmail.com>,
	Jack Matthews <jm5112356@gmail.com>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Rayyan Ansari <rayyan@ansari.sh>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Qualcomm dts updates for v5.18
Date: Tue,  8 Mar 2022 17:44:37 +0100
Message-Id: <164675781029.4163171.4681969362994979342.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220301042828.1805481-1-bjorn.andersson@linaro.org>
References: <20220301042828.1805481-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 28 Feb 2022 22:28:28 -0600, Bjorn Andersson wrote:
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> 
>   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.18
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 40c13296f848f58cb7d77eaa5b620f6f7ecf275d

       Arnd
