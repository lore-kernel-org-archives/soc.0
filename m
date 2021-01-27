Return-Path: <SRS0=JtRh=G6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C44B3C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Jan 2021 18:05:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6715864DA9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Jan 2021 18:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6715864DA9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5PnUz3BSl3TuMSNrmPh8+nMQwUaSOUKH+iDLKxXrCVo=; b=gN8zlf6hJZhwVpp7RaVn2XRKb2
	OYaScP0vN2YZImI+79SswXRbiVJoFpjjHDFS8DJIZUE35+0MTRRXMTIrbmqVmHEyr+3PypTCux4SB
	8g/aNUvBjeFiA7t2fefN71WTQmk1R2l8oav/6OO/QaBBHQ62VKWrTgh1CSx+XbW2Gx3Bw/w8s/omq
	yUfsSTAGgs+ZZ/U7M9fd11arc0vtAXOkFhzqXeARU3gNLCd0vebbjVx2fRn2qeY1AQcHF8MYHqIer
	iNfuwOv4oYX/SYr00KFUfnv9K5VSSTyX2GAhjZ0cXs91YRBn7Ie+hyxPGjAdSNWMoeqL8cgTzoZgE
	/dlCKhGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4pAq-0007i7-9S; Wed, 27 Jan 2021 18:04:12 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4pAl-0007hB-Vj
 for linux-arm-kernel@lists.infradead.org; Wed, 27 Jan 2021 18:04:09 +0000
Received: by mail-wr1-x42b.google.com with SMTP id g10so2890017wrx.1
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 27 Jan 2021 10:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=KWqNh8H9jxNujMamWE5tQ90c+C/64uDI1+7zlC8RlOU=;
 b=FvHguWbJZsfCtr97HAU4oObBcCxwx8i+tTMOp3CL+atazyIAjaiOB1RrudyWlAdY0P
 6YcbcYvX1RLD9UI35zd4tMLXT+pS0dpmnYQF2Hk5nFWYu5bcD9sfdPuAjmBaeR1ccC2w
 yxMQjX4QGcULH4wzCX8ODJTC29fQYxXULmPQs9YbTcwK9tUx0pv0gMAHtffGavGsdraq
 +cLjMwr0xEorOHm/zarnjJkmMlPtSnfBHNbTxD0h5gmBEO4iwNAJw0+Qqi2+yw+JbnHw
 AS/qBAwDjenxh7UDo+vv4+NlmEtO/eAtK5UH2s6/v8ovnUEz9OQ5mi38/4NPI9Xj5cGT
 4HuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=KWqNh8H9jxNujMamWE5tQ90c+C/64uDI1+7zlC8RlOU=;
 b=dPu8Qz5twYj2Xghhxf3+MaJB0ybPgB4VrcT657dRV5KXb1S13E/FAH6EnbByXxcxZH
 GW49duOCjn8M0s6m4eN2MbF2/uV0LNFOrsKoNycoKaK0YetrJTnmGsBoiyKrfqXiDMyz
 P2WAwaaRRdTJFcI4tDf2Hvmf95IqrsqGldEhU23AdFjT6J4aD0WHcwXOeIskkid/1K6O
 m4YAexld0HOKJhco1Qh78XM1Y1kPg07xWICvD1wNzAZV7ixKI3udh8u1DxkI/vBPkZqY
 HMlQ6vdvqedYqvlH/DWXTDNF+WCjZG/cxZpgvIR/9m1eMCVFBSn++WHEToyB5JO5go3B
 Y6/w==
X-Gm-Message-State: AOAM531jlxbrv+0dePngo8daTcry5KQ1ipHtsWq1U2+yoIXvsIynDwvG
 ToEDyL0EwGM4/y7S3bsb7nU+rg==
X-Google-Smtp-Source: ABdhPJzoVQF8wAyVtyXUunZs+vFdUnlobMjssvzSGi9p305OKTw5SJ11zXiYlUrdWtE/784foYAKWA==
X-Received: by 2002:adf:dd0d:: with SMTP id a13mr12423872wrm.143.1611770644971; 
 Wed, 27 Jan 2021 10:04:04 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id r13sm3457725wmh.9.2021.01.27.10.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 10:04:04 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Subject: [GIT PULL] arm64: dts: amlogic fixes for v5.11-rc (round 2)
Date: Wed, 27 Jan 2021 10:04:01 -0800
Message-ID: <7ho8hai7e6.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_130408_131895_2DA33E4D 
X-CRM114-Status: UNSURE (   8.60  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210127180401.cugHjjnO3mCPqZK9dCFhVgF3jtd--tMn6bak6pq7s2I@z>

Arnd, Olof,

We found one more regression in networking on amlogic SoCs needing a
fix.  Please pull for v5.11.

Thanks,

Kevin


The following changes since commit 7386a559caa6414e74578172c2bc4e636d6bd0a0:

  arm64: dts: amlogic: meson-g12: Set FL-adj property value (2021-01-04 08:03:49 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-fixes-2

for you to fetch changes up to 19f6fe976a61f9afc289b062b7ef67f99b72e7b9:

  Revert "arm64: dts: amlogic: add missing ethernet reset ID" (2021-01-26 08:02:35 -0800)

----------------------------------------------------------------
arm64: dts: amlogic fixes for v5.11-rc (round 2)
- fix ethernet resets

----------------------------------------------------------------
Neil Armstrong (1):
      Revert "arm64: dts: amlogic: add missing ethernet reset ID"

 arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 2 --
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 --
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 3 ---
 3 files changed, 7 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
