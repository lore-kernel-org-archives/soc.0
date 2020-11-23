Return-Path: <SRS0=45Hb=E5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13E50C2D0E4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2020 16:51:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A70E520717
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2020 16:51:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yyiiGcaH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="IJq518in"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A70E520717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9wNXiuQ/qLb063tAhneeXP4UFsghzphvFxwe0JvWoFw=; b=yyiiGcaH1RaCogf/EL74nB3N1
	0JI27aSGDwV0HzNERRI9OJftXbIJ7fKvOyUbqEmli53yitGy1Q0r0l4RDjbEksn/sabHsDna3udfy
	6VQ+dN1USJ4fLQIWmjpWzEd2TPfIiX045UmIKnDwRTzvDBOfDdugciTx+BoB3yA88pfYHkxVlWiCA
	1zyuISrNTAOvuLSeakPsP5vV9pph48sGRDakmdpSE4gqsz9QP+XEhu/2GuGk6lQY1gAQbDp77u0dI
	wDhIwDWqt4fWTTRqbbfXbi8xDgBSx9JCISNesizFZjxpoOitWoiRq8khJF0d49MfKGhWH46igo7ZG
	ULyYeb3RA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khF2K-0002Or-8y; Mon, 23 Nov 2020 16:49:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khF2H-0002O3-Eb; Mon, 23 Nov 2020 16:49:54 +0000
Received: from threadripper.lan
 (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4E0D720717;
 Mon, 23 Nov 2020 16:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606150192;
 bh=wtxrWHiHkUJ6z/inA1E4kMFPt1c5qXpOw1gn+8Wnohw=;
 h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
 b=IJq518indwg33XKnc/W/XS1bU5Ji8x9oJPInU/ZNmX3uiowmg15/RUDiPO54WCaNT
 4ewdBZQj+hYttZEp6bsen/UP0cPinRFzE1BUahiokiA4ajoZLjiJpwQ15lo4hY6v0a
 OLJ1n5siQgDiCSyCOeBT7MIm6No0GMo/xzEPBsNk=
From: Arnd Bergmann <arnd@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>,
	arm@kernel.org
Subject: Re: [GIT PULL] Rockchip dts fixes for 5.10
Date: Mon, 23 Nov 2020 17:49:47 +0100
Message-ID: <160615017104.69574.17136500205364184007.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <11641389.O9o76ZdvQC@phil>
References: <11641389.O9o76ZdvQC@phil>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_114953_598759_FD7C40F5 
X-CRM114-Status: GOOD (  11.81  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: linux-rockchip@lists.infradead.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201123164947.XM8OD6XALMJGfVXFRZBPT9EsBzVAjiLAze18x-jC9QM@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 22 Nov 2020 14:33:05 +0100, Heiko Stuebner wrote:
> please find below some Rockchip devicetree fixes for the 5.10 cycle.
> Please pull!
> 
> Thanks
> Heiko
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 4765df4d3a132764077a83ed0df4ee4cc7866fbb

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
