Return-Path: <SRS0=kCD1=PD=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D14EDC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Oct 2021 23:03:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9444E610E5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Oct 2021 23:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9444E610E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/Anbn11NsN6rRzvWoCwz//vj8gKiJq4XVmT9TyEOCqA=; b=NTiT9d9Tmlw0xp
	R26KuFR/NPexoWxJpMb3grKeWoul/y7+qKctbbMozgu7lnv5JdrF0hVB8AJq+6YYcZGdyuzHOVQKB
	+LDwC3G9xB2pY6WTRONQvfluATZTTSCaVFh7MD6ntHWLbRJ0UStVj1aOM4VwJssa1GBpH0JG00hwv
	9E5M/3I92qiZm5ktLkwN9ey7Wk61CtLHy8rzp+YaO9sseb4DtITrp9yTIajNtLlMNgHi+vRNiIgBw
	+UnXpQoXlnvuUvbM+SCydDnYuM0cKirLZfgazJ5yinnpLPtiPBXi+NxNe6itAA6bGFG1rUPL6e6Xz
	b/7QFntj8M4a7AER00hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbWDl-0092dv-07; Fri, 15 Oct 2021 23:02:37 +0000
Received: from mo-csw1516.securemx.jp ([210.130.202.155]
 helo=mo-csw.securemx.jp)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbWDh-0092dJ-RR
 for linux-arm-kernel@lists.infradead.org; Fri, 15 Oct 2021 23:02:35 +0000
Received: by mo-csw.securemx.jp (mx-mo-csw1516) id 19FN2Pm0010544;
 Sat, 16 Oct 2021 08:02:25 +0900
X-Iguazu-Qid: 34tKJZBnPXPWPPOKld
X-Iguazu-QSIG: v=2; s=0; t=1634338945; q=34tKJZBnPXPWPPOKld;
 m=/Yg51QL/k/1sJ4KtYbENYEC+LrsHeFPPeyjECOGHvNU=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
 by relay.securemx.jp (mx-mr1512) id 19FN2Oo5006990
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
 Sat, 16 Oct 2021 08:02:24 +0900
Received: from enc01.toshiba.co.jp (enc01.toshiba.co.jp [106.186.93.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by imx2-a.toshiba.co.jp (Postfix) with ESMTPS id 1A8C710009C;
 Sat, 16 Oct 2021 08:02:24 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
 by enc01.toshiba.co.jp  with ESMTP id 19FN2NcQ010074;
 Sat, 16 Oct 2021 08:02:23 +0900
Date: Sat, 16 Oct 2021 08:02:23 +0900
From: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, olof@lixom.net, arnd@arndb.de
Cc: yuji2.ishikawa@toshiba.co.jp, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: Visconti: defconfig changes for 5.16
X-TSB-HOP: ON
Message-ID: <YWoIf4xPoQtLhC3x@toshiba.co.jp>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_160234_187585_527ADD41 
X-CRM114-Status: UNSURE (   9.10  )
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
Message-ID: <20211015230223.GgGTeTr6luEbtUoYQFSc9rmwoGt28ypuspW5osDQaBs@z>

Hi SoC team,

This request includes patches that enables PCIe for Visconti SoC in defconfig.
Please pull for v5.16 kernel cycle.

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/iwamatsu/linux-visconti.git tags/visconti-arm-defconfig-for-v5.16

for you to fetch changes up to 9606ebc100ef3df5c859397ceddb57426db0ecc6:

  arm64: defconfig: Visconti: Enable PCIe host controller (2021-10-16 07:34:01 +0900)

----------------------------------------------------------------
Visconti defconfig updates for v5.16

- Enable Visconti's PCIe host controller in the ARM64 defconfig

----------------------------------------------------------------
Nobuhiro Iwamatsu (1):
      arm64: defconfig: Visconti: Enable PCIe host controller

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)



_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
