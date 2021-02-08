Return-Path: <SRS0=U7wc=HK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AE47C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 20:38:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 251B764DAE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 20:38:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 251B764DAE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VxYm85CGDiYj0s7q1+6p7qd97oUn7kB2tYSXf/dXND4=; b=vv7o5M9XWdt1qBpXvWlyZsvX9x
	MPp5DtpX73cOw7uJv8paD/obIwG9ABc949AqPRgpKtzeojY3yXDwKpIVjQOd1D4dCN7vH3Ru5LNul
	P+vKoKYuX2NCGStKxoGZ3f+/npp8tEwLLBlN2X9hbx7Y/WBF0anCHk3xsFme6b1C0WkBLrwfkLMcc
	kLBUbELAZafBVN4nppqA+BcPYV7QPSoq5NMiFkO0t5OsUmn4kzLheDE8em6kkQUDc3qQjXu+I0TcT
	iqoR3gmbRJxd4lRqEofueooqdmKEXAN+gelB6roL1ZWAe1mT93RMPVWFnmEtU3eewUTt/JD3vj0Qr
	7W9UpOvA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9DHT-0004zM-GK; Mon, 08 Feb 2021 20:37:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9DHQ-0004yY-L2
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Feb 2021 20:37:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5AA8164E54;
 Mon,  8 Feb 2021 20:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612816626;
 bh=TyeD4K1P5vUntgNfyF2TCOemZLb/fT9iSjguOChf9ZI=;
 h=From:List-Id:To:Cc:Subject:Date:From;
 b=ctXqYScIlRy9apfRcxXFkUl+R6uLEWLQt8k2A4pm0gk14xHDkpKFHeZBiZ08hMQlD
 SjZNtVLD+JHAxoWL87ZvN0NFNF+nauyt2VU91HGdYQf7dHzjnVUqUHKJ9NUwm33qR6
 MXKWDiVDJjmjaDf9Hjd7decFs/0X31J3wRQWhjNKayugMWHCHCNgZEyiQgdFKGv04h
 JNoM1bi+K+jLpVpJU7DFCiVcUilgum/LZrTwEX5LHJDVU950555+ENLm9ml4l6GnaH
 r3kkZt7Aof77GtfrEBmwaQlQCLxfQQN/870y5wJ3eCyVgSwUigz4LkgFbTYP4ARKOq
 yd4VOU2ZJTXQg==
From: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Subject: [GIT PULL] SoCFPGA DTS fix for v5.12
Date: Mon,  8 Feb 2021 14:37:03 -0600
Message-ID: <20210208203703.36109-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_153708_786480_C069FC3B 
X-CRM114-Status: UNSURE (   8.73  )
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
Cc: dinguyen@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210208203703.zEdV_Rgv31ds66lbB9Zd01pYPvKvLS_PXs_A7qWD86E@z>

Hi Arnd, Kevin, and Olof:

Please pull in this SoCFPGA DTS fix for v5.12.

Thanks,
Dinh


The following changes since commit 1048ba83fb1c00cd24172e23e8263972f6b5d9ac:

  Linux 5.11-rc6 (2021-01-31 13:50:09 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_fix_for_v5.12

for you to fetch changes up to b7ff3a447d100c999d9848353ef8a4046831d893:

  arm64: dts: agilex: fix phy interface bit shift for gmac1 and gmac2 (2021-02-04 22:29:00 -0600)

----------------------------------------------------------------
SoCFPGA Agilex fix for v5.12
- Fix PHY interface register offset for GMACs

----------------------------------------------------------------
Dinh Nguyen (1):
      arm64: dts: agilex: fix phy interface bit shift for gmac1 and gmac2

 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
