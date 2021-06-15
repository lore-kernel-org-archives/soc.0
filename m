Return-Path: <SRS0=uLNJ=LJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCF3FC48BE5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jun 2021 23:31:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 982386128C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jun 2021 23:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 982386128C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6KVF19uNKkZhNmdSaXLfEhAxn9iyfvJdOcaS0qOEeFI=; b=B9B7kXKpFFWv7G
	w36Y1wNRwbkR3rrkh+5OV5U/zzf8fHTrywdt3I+QSKkXcYCH4zjM1ZCAI3l9QvGxAHLkdbQXwh+ME
	Gy2TUrMqjP9hhomVPS7Ap9ioN6cx9QgDlkhugsIAPasDltfkPzucH6aWM5hji5j6928VrMkfh1x52
	IfIRc2UuCmV+P9S6vEJ5JjVA0+P28s9fnL6xOCvwPfLhBGqOspO4X7BV+LiO/zZWtlXbQnw4brZe9
	FyrpaiVdphxDsj1OoPOG2sJy9Vzl+B2oZ1jfKPVqJ0MmphQp7HTChS1v7scvP0AcKgnZW6VmxuvlJ
	7x8g1zAVxTb7Rgl7dCQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltIUc-003rmw-FE; Tue, 15 Jun 2021 23:29:15 +0000
Received: from mo-csw1516.securemx.jp ([210.130.202.155]
 helo=mo-csw.securemx.jp)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltIEc-003nCI-VB
 for linux-arm-kernel@lists.infradead.org; Tue, 15 Jun 2021 23:12:45 +0000
Received: by mo-csw.securemx.jp (mx-mo-csw1516) id 15FNCYvG028674;
 Wed, 16 Jun 2021 08:12:34 +0900
X-Iguazu-Qid: 34tKC7reYH2pvMRY9Z
X-Iguazu-QSIG: v=2; s=0; t=1623798754; q=34tKC7reYH2pvMRY9Z;
 m=7Et6MiZCTcIR0klhswAQMnZP3xCuMublo+Td5JTu9PQ=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
 by relay.securemx.jp (mx-mr1510) id 15FNCXvi020335
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 16 Jun 2021 08:12:33 +0900
Received: from enc01.toshiba.co.jp (enc01.toshiba.co.jp [106.186.93.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by imx2-a.toshiba.co.jp (Postfix) with ESMTPS id 451761000D5;
 Wed, 16 Jun 2021 08:12:33 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
 by enc01.toshiba.co.jp  with ESMTP id 15FNCWe7024733;
 Wed, 16 Jun 2021 08:12:33 +0900
Date: Wed, 16 Jun 2021 08:12:32 +0900
From: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, olof@lixom.net, arnd@arndb.de
Cc: yuji2.ishikawa@toshiba.co.jp, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: Visconti: defconfig changes for 5.14
X-TSB-HOP: ON
Message-ID: <20210615231232.pllzlqoamkmnsqq6@toshiba.co.jp>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_161243_271084_A55B0DB8 
X-CRM114-Status: UNSURE (   9.43  )
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
Message-ID: <20210615231232.ThAxrrgb7ZXDOrNXosI81U9Inpq5QcFz5e_4b1I1Of4@z>

Hi SoC team,

This request includes patches that enables PWM and GPIO for Visconti
SoC in defconfig.
Please pull for v5.14 kernel cycle.

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/iwamatsu/linux-visconti.git tags/visconti-arm-defconfig-for-v5.14

for you to fetch changes up to d1588b22dcbb662d94740489713b8fcfe3c13023:

  arm64: defconfig: Visconti: Enable GPIO (2021-06-15 09:03:32 +0900)

----------------------------------------------------------------
Visconti defconfig updates for v5.14

- Enable Visconti's PWM in the ARM64 defconfig as a module.
- Enable Visconti's GPIO in the ARM64 defconfig.

----------------------------------------------------------------
Nobuhiro Iwamatsu (2):
      arm64: defconfig: Visconti: Enable PWM
      arm64: defconfig: Visconti: Enable GPIO

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
