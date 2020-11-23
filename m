Return-Path: <SRS0=W4bh=E5=lists.infradead.org=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD1DCC2D0E4
	for <linux-rockchip@archiver.kernel.org>; Mon, 23 Nov 2020 16:50:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DA3F20717
	for <linux-rockchip@archiver.kernel.org>; Mon, 23 Nov 2020 16:50:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="me8SvrSi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="IJq518in"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DA3F20717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uZGqMK+NbpqLjlUvWjlf/zy8DE8biIQ4MTOpCAeHwRw=; b=me8SvrSiYETfSvKIkz75MFT35
	9bg9i8u72mTlSO/I2gPehRagvu8yEUSOfPujWGsGtZl7P6Q4ebvtqZ1VNPTvxKOH2jEw96OIVaQ15
	ZHpcYt8Uou5D5HlxKlU8RqVlTueIiSTNQ33fz4Yu0DnP4g/W5to78DSdT5lhyuZKuSNDfBgfzjqw4
	1U9tupHHx13QkZncjSN9WPGg2B8aGNxW9JUVAXVOG4V5f7l3IR1mXt0MimvNdS9Zj1zMrF4OfH9dh
	OFurjMKTY8Aj+dmsCaI3QuQZk4UaaO8lMIR2dA2cyGDoq5N3umQwdrC+sKFZTo6mRPe16Ocq/74KO
	mUJHQ5GFA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khF2N-0002Pe-2a; Mon, 23 Nov 2020 16:49:59 +0000
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
X-BeenThere: linux-rockchip@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Upstream kernel work for Rockchip platforms
 <linux-rockchip.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>, 
 <mailto:linux-rockchip-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip@lists.infradead.org>
List-Help: <mailto:linux-rockchip-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>, 
 <mailto:linux-rockchip-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: linux-rockchip@lists.infradead.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-rockchip" <linux-rockchip-bounces@lists.infradead.org>
Errors-To: linux-rockchip-bounces+linux-rockchip=archiver.kernel.org@lists.infradead.org
Message-ID: <20201123164947.aQq6am9h0fz9SG-lJHmAa09Rpn-OSuOJyzx-6y5bMGc@z>

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
Linux-rockchip mailing list
Linux-rockchip@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-rockchip
