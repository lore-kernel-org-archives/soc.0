Return-Path: <SRS0=ky5b=NR=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60875C432BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Aug 2021 09:49:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BC31610C8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Aug 2021 09:49:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2BC31610C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JV5zTwFI3QDljHTsrnfAp8h4kWOOe8a0gsvzYrCJbx0=; b=YruyERzLQLFUh8
	vOAo8165/mAX/V21FPGn56120KReYB3xVsBw4JKOq3LVmfgx7ulQHLrtGl2lPICOt5RzalCBUab2R
	403ypTLDZ5ju8MZX0XyhIcnZ9bfSqUpPE0b6ZFts2ibTe6BBTv8DdoVl+EhsUPUrByB+nImXpTWak
	yeCcC4oVIEGjyDjM9QAfPWH3BjWfcGCo5NmpJvfnfOAsH0Adme3HIRIj3p3iGYMvAi4LUL43Soiex
	F3rm/XbOCKm+ia9y8p+9/cL0Sa3+2IddWwnXELTPMW5AjgiOoVULj4NP3jvup5yVzOfDqoOKILJjq
	p23aGcjqXb9bvMkpu/Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJByV-009how-JM; Thu, 26 Aug 2021 09:47:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJByL-009hnx-5z
 for linux-arm-kernel@lists.infradead.org; Thu, 26 Aug 2021 09:46:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8FE1260F44;
 Thu, 26 Aug 2021 09:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629971216;
 bh=UZZH19xbwj74O/7bpUUVl19SrnCrf9VLxXK24VhzoDA=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H6eL5Tie19SlPwlKpUv4B3GhTJy5q0CRd9/+xbTJHSpng6O1tJ2Jit8t+i9PcBRjh
 hWTy09bX9ZTn76P6mZfgAl/pCFDL5L4SGtfwv2yY2OCRGVq9LdozMQFEn4ouCnAY7y
 lVDVgmTiSjYJRI5q9R8TthPjiFHri29nA7k6IP4jsuygtiARzD+WPXsafAmzaD0e9J
 huqE3KUp/SDBmhTXuWZoZENKaLaEsBA7WPtnla+4e+nOx+aZjR054LnkYV67xGcjxX
 bIdjPmG8Y+ys60K9sbmVyLniVrbYpXz6rtVD82/A0ZgN/iTYx/D3jGIQhfeD2wCPFV
 3U7DXg6r0XKvQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>,
	Michal Simek <monstr@monstr.eu>
Cc: Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 arm-soc <arm@kernel.org>
Subject: Re: [GIT PULL] ARM: dts zynq: Xilinx DT changes for v5.15
Date: Thu, 26 Aug 2021 11:46:48 +0200
Message-ID: <162997120238.839533.17091999406711694821.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <f3dc69c8-8a22-e938-4ddf-b1052b8c1437@monstr.eu>
References: <f3dc69c8-8a22-e938-4ddf-b1052b8c1437@monstr.eu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_024657_287465_293FF487 
X-CRM114-Status: UNSURE (   7.48  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210826094648.6EFwwX6xpA9TVHw3bBZeWmOMoBxo_q0BWT9NVXN3sOo@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 25 Aug 2021 09:28:55 +0200, Michal Simek wrote:
> please pull these two patches to your tree.
> 
> Thanks,
> Michal
> 
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 9fdbbe8443a372088c809eb8f2cf4488a41333e8

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
