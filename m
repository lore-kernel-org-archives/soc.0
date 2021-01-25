Return-Path: <SRS0=vGGV=G4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A50AC433DB
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Jan 2021 18:42:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4817B23105
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Jan 2021 18:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4817B23105
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oEff6i8SvCEfTMkMTDA4bXJnCVXhCvaBNqmRkO1QlYY=; b=pf2eMN0q7VP65U4Xx2zLrIJg7B
	XwLWeVletgbke3cCSCLaUzgfz+YGKzkgp4w7dd+y6vm3ZLkJ2q2PMINoeWHrlTpdSswPcWR1TjfGW
	Fnt8POz26bfdV+mKLWA0VhB0x4hdFRwnGYgOtllUILC08xS1jzrsSsQ6ywEnd5vjG2R8XYs97mx1c
	3f+oWXnCiyjoP0O7V5EUURz1imI+pPpfCTiU7KrBCWIps0TEby+5OrxvO4T0BHSOdec4JaV+M062j
	njtb+eJrQXhaB4E7ZH6gn716pVfQS5/A4NdhTmuICwQF3YetmZWNEVLmjf9iFOLAsByoTkb7YIUMc
	EIibW3WA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l46oN-00083M-7W; Mon, 25 Jan 2021 18:42:03 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l46oG-00080s-Qt
 for linux-amlogic@lists.infradead.org; Mon, 25 Jan 2021 18:41:57 +0000
Received: by mail-pl1-x62e.google.com with SMTP id e9so8224205plh.3
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Jan 2021 10:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=jXQ+AgoYTmM98NAgT4daWWv0IbWCc91ZsSBMiFQLqKI=;
 b=MVCYhn84ilk6MJg40H2Gp8mu/pgPnezQNhALB4t19Ann8VM+fQr8i9OgC4AvXkcqra
 UNJ82H3rY17aLMoGfgPKREB8JqkVaDdIsvOd8UnP0b9RHSSoYAuaMXD0QwjYpXBj7thm
 NRKU2bs9htwvMDHxSpY+t1cgI77H0Ge855DUn2E7BOmticZ3OTpHe39J393GMcGlW3aW
 RJBZMcYcEVQU/TkZ6Az+ruYDPrMOU/rVgHNwDc4ORZCbGOMDuemAnnNc9snu8wENCB+o
 OuLr+BgRz5+mmNWodq0nTFNzClHk+h278AFypjRWaUdCUHRH5EJx6DZ1yOcc506hG+2J
 PLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=jXQ+AgoYTmM98NAgT4daWWv0IbWCc91ZsSBMiFQLqKI=;
 b=HmGscPccv8dwthi1py/eePe2V9pdipuRB4AH0g302uIx1NMK9InLoGVPX5aDR9RMzi
 MfsC8XgisPMb/0xemXdX024PQSLZa7mau62CeYMZhm9IJVRq2bIQIA8kkICHXa/Pja+C
 3YAlXVriGJPm/Lv6xKwH4eA/5sDwvuPTJIRP1WpJZz73g5d/i3pMaH1yH6KPLZdOhLsc
 U5ckkzFUk3sTkNxSFnx1QgOjY8x+jG7SbFdc5Zd1fbK2kdbys3gSaQn9QRDSWTzjbYBX
 hpFzuAYNqTmArqASgi9LhqPjdATioU77SrswEoc5SwZxoz8pnGxmcVlaw+gbWhC/WUK0
 Qbcg==
X-Gm-Message-State: AOAM531bX4iPXrv1dIJQxeHcmmGxRZcL57zh9i0swV7zVt1uS+w43cMa
 t878pmkIn9rwed7VJpFolGfWEQ==
X-Google-Smtp-Source: ABdhPJwhGgc3h+D1tMSNNF4bVe7+dAcrmANOkFoJj6ztOo4JgNE6rO+rzi4sqKTBf5ECFXjfqQHVxw==
X-Received: by 2002:a17:902:f683:b029:de:18c7:41fa with SMTP id
 l3-20020a170902f683b02900de18c741famr1776590plg.57.1611600114283; 
 Mon, 25 Jan 2021 10:41:54 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id o14sm18310825pgr.44.2021.01.25.10.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 10:41:53 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Subject: [GIT PULL] arm64: dts: amlogic fixes for v5.11-rc
Date: Mon, 25 Jan 2021 10:41:53 -0800
Message-ID: <7hk0s0x3im.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_134156_908209_B52B0346 
X-CRM114-Status: UNSURE (   7.42  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
Message-ID: <20210125184153.bKgJU4tdqDCHF8WV8cIsPNsLekpj6__RUls8yD4g36E@z>

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-fixes

for you to fetch changes up to 7386a559caa6414e74578172c2bc4e636d6bd0a0:

  arm64: dts: amlogic: meson-g12: Set FL-adj property value (2021-01-04 08:03:49 -0800)

----------------------------------------------------------------
arm64: dts: amlogic: fixes for v5.11-rc
- meson-g12: Set FL-adj property value

----------------------------------------------------------------
Serge Semin (1):
      arm64: dts: amlogic: meson-g12: Set FL-adj property value

 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
