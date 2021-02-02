Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37CFCC433E0
	for <soc@archiver.kernel.org>; Tue,  2 Feb 2021 17:10:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0EE8964F86; Tue,  2 Feb 2021 17:10:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C7AE764E08;
	Tue,  2 Feb 2021 17:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612285832;
	bh=ybDthzdFdusXcNHi8JLHA0d661hIwPmqgNAYeGAgYKM=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fNBt9SVwFYSOfJztnnL6gwSExdxitHL4kL37IGoIOPT0z4SHAHqfcjBjheVLWTOMU
	 aVg6Uz0EoLRtgOeFvaO7lkltTqQtlJcm9/ZUv/u02vYV7GhoPtT5G8R6blpCw3bB1j
	 SgYjOVNeSME8xUhp4RHWtHja/91AmW8dMmiSEPlN4KmfMT+2N35DwmGKbTzM4y0eGz
	 9JHMFQdo535OMtTU8Q+UNbcbOEMoZr2R7v1Ccg2c9ASKUW1UGtLhQH47EUpO2F+Kmf
	 wETzgScdAMAFJTIoBbduM9WoPThzlatStmS8ZJDpBi9roVbr1/BimiEppD6DBBQv0X
	 etb58GHfUUU4g==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	soc@kernel.org,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: ux500: Add Flash LEDs to Samsung phones
Date: Tue,  2 Feb 2021 18:10:11 +0100
Message-Id: <161228552296.1852435.7133847671539908376.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210201091308.284465-1-linus.walleij@linaro.org>
References: <20210201091308.284465-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 1 Feb 2021 10:13:08 +0100, Linus Walleij wrote:
> This adds the Richtek RT8515 Flash LED to the Golden,
> Skomer and Janice device trees.

Applied to arm/dt, thanks!

[1/1] ARM: dts: ux500: Add Flash LEDs to Samsung phones
      commit: e9cb878ec238f85b81c7b439b4280062d4fbf9b8

       Arnd
