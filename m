Return-Path: <SRS0=+LcQ=PI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FDD3C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 21:21:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35DBD60F9F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 21:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 35DBD60F9F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aWE83jHkxCKUnA1D3Huv9MoiUoVdcmIgfrgVPmBqZUc=; b=s0ztzjffkoSrJx
	SSLX6he9IWy7J+WX/GXoMWbery0o2Xm8SPnj/+B+6OixD6Sre/QKleJ8klw5KLPRZcc1FiMoyBvtS
	oxZoWAnML3ye0O8JLh2uL+8dQuD+PlsTsQ8pfRNhM1UruLMZVloHIQpRke4uu+FER+9+mncegs/iT
	JcFJF0Y+xTUJXyXlgKu7Q4Izqy7dUEDaPepknzmnrwv7LHWoofGiMbGhl8tYzsILrnMzJmWDA9BeM
	VJmWZFAAyLMvv/H9u6L4EDs2CF+3+yFDcIQiTn1EqHLH+RsECjJ3TQPppJYTBdQ6KJZeS5w82ym3x
	Ed8Xjvax2NOr/dNfw+Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdJ08-005p4V-Ds; Wed, 20 Oct 2021 21:19:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdJ04-005p3y-Ky
 for linux-arm-kernel@lists.infradead.org; Wed, 20 Oct 2021 21:19:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D87CB611ED;
 Wed, 20 Oct 2021 21:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634764792;
 bh=vOnga4+S7JQrf1JZSTQEgsG2EIm/hjoP9XGkyTTjbPU=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X+PXFzWbpJg/rQR+RoWb1aNexHOEKH8g4s31+icgyTlJGoZMtysHPCWabXkfD22jz
 jdG7BuuA2ra6UcUQMaoVJBWFv8rtdNNe4CwSJk0IBpPTFAhl6md9Toz6YB+R8/XmvL
 SQ5Hi9YORPOdXNxhNRJIhrZtm5/e0OwUddxa3qhLa1tZ5fxgi8VAoQdakdtA3G34U3
 fG/o7PYe17CHWLBuSdNUpRgRTl26XJftSRuE/7QOzPExeAnYcblhHExuS32F9YlNs5
 nGsSM55Y7kbqxAUYXNfzrEubb1twKdZVDSFryXMOc2IKvbaOTyv6Y46qXmbrYIeVP5
 qPHPuwiwaIJ1Q==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Romain Perier <romain.perier@gmail.com>,
	arm@kernel.org,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 Daniel Palmer <daniel@0x0f.com>
Subject: Re: [GIT PULL] ARM: dts: mstar: updates for v5.16 v2
Date: Wed, 20 Oct 2021 23:19:47 +0200
Message-ID: <163476478083.3883860.2276304001113700666.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211020163010.3079-1-romain.perier@gmail.com>
References: <20211020163010.3079-1-romain.perier@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_141952_737755_48E42704 
X-CRM114-Status: UNSURE (   7.88  )
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
Message-ID: <20211020211947.w-xVXcP_ctMwockLGIpja02gS7lhSKh5ra3jBT61DkQ@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 20 Oct 2021 18:30:10 +0200, Romain Perier wrote:
> Here's the ARM DTS changes for v5.16:
>  - mstar-v7: Mark the arch timer as not being initialized by the firmware
>    and rely on the physical timers.
>  - mstar-v7: enable rtc
> 
> Regards,
> Romain
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 06fab4a544a288220abd3803b8a2e88c17c049ff

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
