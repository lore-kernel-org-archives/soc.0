Return-Path: <SRS0=UpmX=PG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68D8EC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Oct 2021 10:00:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 394A360F57
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Oct 2021 10:00:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 394A360F57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Le9IdIoaQId0XY2WkKW285u/qUJvMjcNkVPCwKIAjzs=; b=m8zE1/1TrutRuW
	BRXR2ROFOYzVeUcUze9664Fl1XbWoCDPMno5G5HhbYIMrVC1wp0LEuQJcTwe+n+0ZgEct+tNW4xLv
	BzzCryXqpH+x58hZIdoIaOyVfyEuPVtfflSvwy5to5ymxTPrqJwAKknsgNbBh7+Z47FNMhYqSPPuo
	BI6vEzJYrMshxzG3K/+msY/lUXBksL4dAaks7SB8nfgZW0y4gKuyfznOpe1sYrVQkGTu9yXcVnvbW
	qb9j29Qxk1NH3rWy4eK2CfKDTxSgrymPsboS/wdxKK4daZvj9ESTaHMmiO4WBkkcNUq+fI5Hbs+wA
	Bp1WOl+APAc8xESoZD/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcPQJ-00ErJX-LD; Mon, 18 Oct 2021 09:59:15 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcPQE-00ErI6-Th
 for linux-arm-kernel@lists.infradead.org; Mon, 18 Oct 2021 09:59:12 +0000
Received: by mail-wr1-x42b.google.com with SMTP id u18so40395645wrg.5
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 18 Oct 2021 02:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ez9mbYG7dlgdhn9DND4IOScLuOYSIdJep7VgoVti+SU=;
 b=B9l2H+QZhkUorTGtrqoWbmg9pHgLN6o/lwXWs6RUWrV2WxlyyBHxmgdlaKNxqmG2sq
 ni+bGosqtScoJ3G4HKplSeIgvQbvTCj/VI9lTVPmsXXWulQUg8B2TcwLfPhZYBoo9mK/
 lOjIUCVGbtvAKHgDs+2OhcnVhFl9w2uUt9auHdT02PK/2grYM/LHXpAS/3XEiME+4Kpe
 6wZdXvFwaqzLJGKzOUFrQaLRe4kiQU9bAYL9fxXHQCzjiMyS1hiLifhI0E4Bnmv3lopN
 Kd68rVhmGP5VHutG5XA26eyDXPx8YE5WoB3eq0mug1s0pH9mkbW/3hNFQ39H/AUElxtR
 LJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ez9mbYG7dlgdhn9DND4IOScLuOYSIdJep7VgoVti+SU=;
 b=JU5P0Y/Uy/9vDcrWn7MzAt7Z1FXDzXNrk+FdyPNs6Yon0NwJneHlcVTXqrdG2Ply64
 ScMwyVSRl1jsSjAXcsm/E8EEzVdBQOO4+aZYqLMUZR0TzODNPH2GaJ9XHqqKHN0+inB2
 YfQD1a7vbyr2cmk8q/Bw7LQggkPL7aEJeFSOrpFS5zjaw1kmjEStYkISB+A5J/Ury6PD
 FZ6J8QxIh/7oBrUjFQkTaLMHGdsYa8R6PhNR0ITySVTunWVYtTnABPlcR64sxaY2G4Zq
 CuUS/ixOOq4/TTJv1qkVnkSZc2lSs9zm7wv2y8y9pF3JiuAJGVs9atukMMVCYvIYwYPs
 nnrA==
X-Gm-Message-State: AOAM533Wh5IfvIQUGCAXy8/do/5RgbcYApXHpIpy1JRv+EfZ5VWF2vXh
 bzzUU4PGYNCVgnXpJw9BYZI=
X-Google-Smtp-Source: ABdhPJwDo6uDJUvqKMwObGEwGoRekkvSL6t9p/QE07mSMIF3yjAZd0SCynhMTMhOAjbORzhY9ITBPQ==
X-Received: by 2002:a5d:598a:: with SMTP id n10mr33842460wri.93.1634551147675; 
 Mon, 18 Oct 2021 02:59:07 -0700 (PDT)
Received: from debby (234.ip-51-91-57.eu. [51.91.57.234])
 by smtp.gmail.com with ESMTPSA id g33sm11047177wmp.45.2021.10.18.02.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 02:59:07 -0700 (PDT)
From: Romain Perier <romain.perier@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Daniel Palmer <daniel@0x0f.com>,
 Romain Perier <romain.perier@gmail.com>
Subject: [GIT PULL] ARM: dts: mstar: updates for v5.16
Date: Mon, 18 Oct 2021 11:58:48 +0200
Message-ID: <20211018095848.19101-1-romain.perier@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_025910_983214_7917896A 
X-CRM114-Status: UNSURE (   8.47  )
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
Message-ID: <20211018095848.nHQyzmx3gsD99EazuwBqcz6KaFxLP0H3AFu_6pcjXyk@z>

Hi,
Here's the ARM DTS changes for v5.16:
 - mstar-v7: Mark the arch timer as not being initialized by the firmware
   and rely on the physical timers.
 - mstar-v7: enable rtc

Regards,
Romain

The following changes since commit 64570fbc14f8d7cb3fe3995f20e26bc25ce4b2cc:

  Linux 5.15-rc5 (2021-10-10 17:01:59 -0700)

are available in the Git repository at:

  https://github.com/linux-chenxing/linux.git mstar-dt-next

for you to fetch changes up to 7e626b6d71e7678e85e9e06e9e2271b5923741fd:

  ARM: dts: mstar: Mark timer with arm,cpu-registers-not-fw-configured (2021-10-13 18:53:48 +0200)

----------------------------------------------------------------
Romain Perier (2):
      ARM: dts: mstar: Add rtc device node
      ARM: dts: mstar: Mark timer with arm,cpu-registers-not-fw-configured

 arch/arm/boot/dts/mstar-v7.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
