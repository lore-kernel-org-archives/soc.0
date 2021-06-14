Return-Path: <SRS0=Lfaw=LI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 644CEC2B9F4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jun 2021 23:51:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18A2C613B1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jun 2021 23:51:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18A2C613B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GxwTNx9NXYiktBzlcN3QiC1V/4C5kmmb5ThO+zYILRc=; b=q1IqVSmrE4k/ce
	5Q6b4Bn4x0SJkRbpdKYUqGDTEFAVLlHz8A13TsbAMqTnyl107fwJFc0+f7cU/b/tYzkyI/puJ5CxR
	jZ+lEiARKbObLC0tmXSWF9KE81CGuLlTYZ20p95FI+MT56WQd6JBC2nRLiITBHwUh4Qq0Pp+YSi8s
	+Go/2q0K2FBtrA5uBQdBrTkVWzZhaOr0vIODWBgMO/PJvw8E5mXj7MxSavCi+j6dcpitnpUtzj8XA
	MrN1OcyugTSKzNmNPwpZvkIGQCEZP12YXGxM/dRWRhsjsuwUypli8wCVdNXih7RCvvYcAQU2sTHyQ
	f8Kb1yZCijQ6tfUTw6xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lswIV-00Gah5-6x; Mon, 14 Jun 2021 23:47:15 +0000
Received: from mo-csw1516.securemx.jp ([210.130.202.155]
 helo=mo-csw.securemx.jp)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lswIR-00GagE-Ay
 for linux-arm-kernel@lists.infradead.org; Mon, 14 Jun 2021 23:47:13 +0000
Received: by mo-csw.securemx.jp (mx-mo-csw1516) id 15ENkwRQ024308;
 Tue, 15 Jun 2021 08:46:58 +0900
X-Iguazu-Qid: 34tMM6VucyrxN4YB1E
X-Iguazu-QSIG: v=2; s=0; t=1623714417; q=34tMM6VucyrxN4YB1E;
 m=DEUh+4u85pEsAkByQzSzgEoDoYAYV9OXSYKv9iFVJk0=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
 by relay.securemx.jp (mx-mr1513) id 15ENkuDx003257
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 15 Jun 2021 08:46:57 +0900
Received: from enc01.toshiba.co.jp (enc01.toshiba.co.jp [106.186.93.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by imx2-a.toshiba.co.jp (Postfix) with ESMTPS id 1E66C1000CE;
 Tue, 15 Jun 2021 08:46:56 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
 by enc01.toshiba.co.jp  with ESMTP id 15ENkt53022785;
 Tue, 15 Jun 2021 08:46:55 +0900
Date: Tue, 15 Jun 2021 08:46:54 +0900
From: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, olof@lixom.net, arnd@arndb.de
Cc: yuji2.ishikawa@toshiba.co.jp, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: Visconti: device tree changes for 5.14
X-TSB-HOP: ON
Message-ID: <20210614234654.2u3xetnn5rwhymwz@toshiba.co.jp>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_164711_603365_46D90782 
X-CRM114-Status: GOOD (  10.28  )
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

Hi SoC team,

This request includes the PWM DT patch for the Visconti SoC.
Please pull for v5.14 kernel cycle.

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/iwamatsu/linux-visconti.git tags/visconti-arm-dt-for-v5.14

for you to fetch changes up to 172cdcaefea5c297fdb3d20b7d5aff60ae4fbce6:

  arm64: dts: visconti: Add PWM support for TMPV7708 SoC (2021-06-15 08:25:28 +0900)

----------------------------------------------------------------
Visconti device tree updates for 5.14

- Add DT support for Toshiba Visconti5 PWM driver

----------------------------------------------------------------
Nobuhiro Iwamatsu (1):
      arm64: dts: visconti: Add PWM support for TMPV7708 SoC

 arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts | 8 ++++++++
 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi        | 9 +++++++++
 arch/arm64/boot/dts/toshiba/tmpv7708_pins.dtsi   | 5 +++++
 3 files changed, 22 insertions(+)


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
