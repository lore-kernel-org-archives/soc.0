Return-Path: <SRS0=5UrE=IR=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 446BFC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Mar 2021 08:53:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D73D764E1F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Mar 2021 08:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D73D764E1F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nO6fBB9XrV7r02CGaKxM4qIklMJuar8NXL7ZLFAnwcw=; b=AfrZvL3y4yeVebype1qUhq6ZM8
	nb/snh6bgn6tCDznW2KVZdeQiyMbRTLxDgLyI9g9dGf1Y1DcXS/fFpoJ1dyaPbVeG8/4V6hmw/MYp
	PLNlQO4Iwqkn0YfZrDDW1YBg4ZPLS3CApmf66HflCoNm5Ydzb6Da3gv5cUb99vMTxYDgoeLbXak9F
	5YgA4OCJgBSmA59SWt44A/pbI9Y4T16fsWd83fUtFJ3BffsfjmmYk3ctdIp+EK0Ygpj525IiD5TWl
	Yb9sXInfk18RGZkGXsq6XveGlsd3/MppwyFjZeb1BaVLgjFw88ngxskGrE+ZNAZjP2v3xBtcBcaO4
	ukZXiDSg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNArR-006u5B-8F; Fri, 19 Mar 2021 08:52:01 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNArK-006u3j-Sg
 for linux-arm-kernel@lists.infradead.org; Fri, 19 Mar 2021 08:51:56 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:207d:4b39:ec21:2531])
 by baptiste.telenet-ops.be with bizsmtp
 id i8rt2400B3CXdgx018rtWS; Fri, 19 Mar 2021 09:51:53 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lNArI-008kfs-PA; Fri, 19 Mar 2021 09:51:52 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lNArI-00BMy0-4d; Fri, 19 Mar 2021 09:51:52 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	arm-soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas ARM SoC updates for v5.13
Date: Fri, 19 Mar 2021 09:51:43 +0100
Message-ID: <20210319085146.2709844-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_085155_072171_F81CC7CD 
X-CRM114-Status: GOOD (  14.47  )
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
Message-ID: <20210319085143.cqxQYPjYJjTBOj7DAhS87RKeEFZjBWjfld_B5nkZv9A@z>

	Hi soc folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v5.13.

It consists of 2 parts:

  [GIT PULL 1/3] Renesas ARM defconfig updates for v5.13

    - Refresh shmobile_defconfig for v5.12-rc2.

  [GIT PULL 2/3] Renesas ARM DT updates for v5.13

    - OV7725 camera support for the iWave RainboW Qseven board (G21D), and
      its camera expansion board,
    - Add mmc aliases to fix /dev/mmcblkN order,
    - HDMI Display support for the R-Car Starter Kit Pro with R-Car M3-W+,
    - Support for running upstream kernels on the RZA2MEVB board, using
      the SDRAM present on the sub-board,
    - I2C EEPROM support for the Falcon development board,
    - Timer, thermal sensor, and CAN support for the R-Car V3U SoC.
    - Miscellaneous fixes and improvements.

  [GIT PULL 3/3] Renesas driver updates for v5.13

    - Prepare rmobile-sysc for fw_devlink=on,
    - A minor cleanup.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
