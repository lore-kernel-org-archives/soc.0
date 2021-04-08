Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2980C43460
	for <soc@archiver.kernel.org>; Thu,  8 Apr 2021 20:04:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B2BD961106; Thu,  8 Apr 2021 20:04:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A363C61107;
	Thu,  8 Apr 2021 20:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617912252;
	bh=q774uT9f38SSGcsrWcfTXh4l9PkW7PDh1OA4r2Aoef0=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JumN8qjMKYpVfGACHDVafEFuBYeg/2lBZkbkUMNI10CMYDlRqafNst8XihCU9h24T
	 a6KuxC//8Qt2wewDFDOSgfD7jQP6lvUxUkFFFXZZkaz0vkWtW5qkAvN3MA7YfEBa4C
	 TN/HHkYfvlnkjCQ/rSVospc6j/K9cggZchy5m7+HmcWLncYDElI/PRdmuSQzRXOkf2
	 fY4WXkMzPPFdgUjOT9FbGTrYPsrjkbuScfzdPKU4RuMROcBXbi/GNa3sJU3Lt9QyvL
	 2mWL/FzplvfeQ5QouW9Zld01jAwxoD0zTZI9Q25cyR495AE2ykz6haMZI6uiENYrit
	 dyznzNiO6fBGg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Wei Xu <xuwei5@hisilicon.com>,
	arm@kernel.org,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	tangkunshan@huawei.com,
	olof@lixom.net,
	zhangyi.ac@huawei.com,
	fanghao11@huawei.com,
	shameerali.kolothum.thodi@huawei.com,
	john.garry@huawei.com,
	salil.mehta@huawei.com,
	jonathan.cameron@huawei.com,
	shiju.jose@huawei.com,
	huangdaode@hisilicon.com,
	liguozhu@hisilicon.com
Subject: Re: [GIT,PULL] arm: hisilicon: SoC updates for v5.13
Date: Thu,  8 Apr 2021 22:03:34 +0200
Message-Id: <161791219759.1659621.15630743637327308533.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <eba8b55e-0969-8ca2-eca3-7c471cb0ff6f@hisilicon.com>
References: <eba8b55e-0969-8ca2-eca3-7c471cb0ff6f@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 3 Apr 2021 22:59:06 +0800, Wei Xu wrote:
> Please consider to pull the following changes.
> Thanks!
> 
> Best Regards,
> Wei

Merged into arm/soc, thanks!

merge commit: d74b25572a4f567b1a200a68dc0d9a9ec9d15390

       Arnd
