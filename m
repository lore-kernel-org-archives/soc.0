Return-Path: <SRS0=mpRk=HM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4245BC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 17:33:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F287B64EC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 17:33:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F287B64EC9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+ar28EJ+j6uWyfke5ZhvJ3lXIadzVb9izYi6vhWYhbk=; b=cQHCRqUmtDtgfdyW2c05KpnsVn
	8aVmve8ZiUt5FZHervLpnP+JPFcMWqXYY2cyDzpB2klXo70r1hWxTNW4RgjOuGcrr6brYf25DZR/B
	WP0sPPoJic59Q2+mw+Gbzy5jJvEpBzdWXbAj+mVdqm9attxQNNhPP9w04ZsDX7jcO2YVHxDEH0QEM
	bfUtfh+hT6xzS/D4IfAAF0YC+ntxM0nK0LMrvDsNh8jn4Kyz7e/Dy/DFVmSQ3gYVeL0ubQqFBfZQp
	Hu36mvzB7EMXRKAaztv1O5zj6xv8JecNTpB8m650Vp2sZKXnI81DR0vkwjL/x5HvDapTDMUxl1Pr3
	RLLIvm8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9tLt-0004a7-Sb; Wed, 10 Feb 2021 17:32:33 +0000
Received: from mo-csw1515.securemx.jp ([210.130.202.154]
 helo=mo-csw.securemx.jp)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9tLq-0004YU-Gg
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Feb 2021 17:32:32 +0000
Received: by mo-csw.securemx.jp (mx-mo-csw1515) id 11AHWEvi014609;
 Thu, 11 Feb 2021 02:32:14 +0900
X-Iguazu-Qid: 34tMScsDAnZFFYdiXA
X-Iguazu-QSIG: v=2; s=0; t=1612978334; q=34tMScsDAnZFFYdiXA;
 m=Km+Q8gkiHMM9wvJSGLkYsgiwpRYJ1OYFW1VtlyXYnn8=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
 by relay.securemx.jp (mx-mr1513) id 11AHWBNW008311;
 Thu, 11 Feb 2021 02:32:12 +0900
Received: from enc01.toshiba.co.jp ([106.186.93.100])
 by imx2.toshiba.co.jp  with ESMTP id 11AHWBGr010235;
 Thu, 11 Feb 2021 02:32:11 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
 by enc01.toshiba.co.jp  with ESMTP id 11AHWBex002763;
 Thu, 11 Feb 2021 02:32:11 +0900
Date: Thu, 11 Feb 2021 02:32:10 +0900
From: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, olof@lixom.net, arnd@arndb.de
Subject: [GIT PULL] ARM: Visconti: device tree changes for 5.12
X-TSB-HOP: ON
Message-ID: <20210210173210.nnytfyrkkj6ylrtb@toshiba.co.jp>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_123230_949090_AAFB4EB6 
X-CRM114-Status: UNSURE (   8.42  )
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
Cc: bgolaszewski@baylibre.com, linus.walleij@linaro.org,
 yuji2.ishikawa@toshiba.co.jp, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210210173210.l_rGLzoFDsm8DGZFP3D6KuaWoY2iRlT825Euf18xHHM@z>

Hi SoC team,

This request includes the GPIO DT patch for the Visconti SoC.
Please pull for v5.12 kernel cycle.

The following changes since commit 4fd18fc38757217c746aa063ba9e4729814dc737:

  arm64: dts: visconti: Add watchdog support for TMPV7708 SoC (2021-01-25 09:20:47 +0900)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/iwamatsu/linux-visconti.git dt-for-v5.12

for you to fetch changes up to 0109a17564fc753d8769a1b8d76db3dba17b959b:

  arm: dts: visconti: Add DT support for Toshiba Visconti5 GPIO driver (2021-02-11 02:01:16 +0900)

----------------------------------------------------------------
Nobuhiro Iwamatsu (1):
      arm: dts: visconti: Add DT support for Toshiba Visconti5 GPIO driver

 arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts |  4 ++++
 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi        | 11 +++++++++++
 2 files changed, 15 insertions(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
