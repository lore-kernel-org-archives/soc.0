Return-Path: <SRS0=ZKTK=FM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F05FC433FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 16:36:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93FA123AC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Dec 2020 16:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93FA123AC8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BB5nJ+qfij28Icfylbg6T1vRUT+SgaVzCgXS2M9VYU4=; b=iAxujpalIztyfpSOUzFe+wRPp
	9Np2nXqa2Sma/EpA3d80JGeCYo/iRjltRVQDjaZ8TgKzeNt2VL6UXVSHD5Bzg8gMt/aDdROcvg++A
	QWrHezyRhPSHSeEGKvP7etpfwB1Hi+JgsA6JG15B4XtnjVh734GAewrrR5dN8u7/CTmx8cXBX9JIX
	Nb612T/G0KtOLfop0l0/HczkvzWjUhrf3QYcQxiTD3Hs4JR6UN/77dntq+Wbqv3lypFWp7cbP0r0u
	Z6D2z2UQ1ctHCu8Y41VxAx80UxMWpkP/xmy16mp9i1RA4AjgMZ/fmE+3pe16LWx2XkF3n72YSTzC7
	OV62dsu1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmfxK-0001KG-Tr; Tue, 08 Dec 2020 16:35:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmfxH-0001JF-Ft
 for linux-arm-kernel@lists.infradead.org; Tue, 08 Dec 2020 16:35:12 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
 thierry.reding@gmail.com, krzk@kernel.org, mripard@kernel.org,
 benh@kernel.crashing.org, emil.l.velikov@gmail.com,
 alexandre.belloni@bootlin.com, mpe@ellerman.id.au,
 linux-parisc@vger.kernel.org, paulus@samba.org,
 nicolas.ferre@microchip.com, tony@atomide.com, sam@ravnborg.org,
 linux@armlinux.org.uk, ludovic.desroches@microchip.com, soc@kernel.org,
 James.Bottomley@HansenPartnership.com, will@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org, daniel.thompson@linaro.org,
 jernej.skrabec@siol.net, linux-arm-kernel@lists.infradead.org,
 deller@gmx.de, tsbogend@alpha.franken.de, catalin.marinas@arm.com,
 wens@csie.org, linux-mips@vger.kernel.org, lee.jones@linaro.org,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
Subject: Re: [PATCH v2 0/5] drop unused BACKLIGHT_GENERIC option
Date: Tue,  8 Dec 2020 17:34:46 +0100
Message-ID: <160744514229.359082.11487352663734358657.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201201222922.3183-1-andrey.zhizhikin@leica-geosystems.com>
References: <20201201222922.3183-1-andrey.zhizhikin@leica-geosystems.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_113511_615798_66FA8353 
X-CRM114-Status: GOOD (  11.72  )
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
Cc: Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201208163446.Rp2iWSL8WI6q1RpGOM-AmBR_rw_nf-glk0C7awJ3RqQ@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 1 Dec 2020 22:29:17 +0000, Andrey Zhizhikin wrote:
> Since the removal of generic_bl driver from the source tree in commit
> 7ecdea4a0226 ("backlight: generic_bl: Remove this driver as it is
> unused") BACKLIGHT_GENERIC config option became obsolete as well and
> therefore subject to clean-up from all configuration files.
> 
> This series introduces patches to address this removal, separated by
> architectures in the kernel tree.
> 
> [...]

While my plan was to only take the arm specific patches, it seems
nobody else has applied the other architecture specific ones,
but there have been a lot of Acks. Also, b4 makes it easy to
merge the entire branch, so I'll just take all of these.

Applied to arm/defconfig, thanks!

[1/5] ARM: configs: drop unused BACKLIGHT_GENERIC option
      commit: 0437141b4e2233ae0109a9584e7a003cd05b0a20
[2/5] arm64: defconfig: drop unused BACKLIGHT_GENERIC option
      commit: 717c4c8336486781630893508b3347ae18953fae
[3/5] MIPS: configs: drop unused BACKLIGHT_GENERIC option
      commit: 2257682282531de45929c6006152f6e2ee881b42
[4/5] parisc: configs: drop unused BACKLIGHT_GENERIC option
      commit: 4e9c44b128d3eb5da129e53c7312240f838c2dbf
[5/5] powerpc/configs: drop unused BACKLIGHT_GENERIC option
      commit: 4985c506303fb6a41a885d503a6e1f3d3126431d

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
