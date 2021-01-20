Return-Path: <SRS0=0ZpT=GX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1210FC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Jan 2021 01:25:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 870B723109
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Jan 2021 01:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 870B723109
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DJAv9l7kBSf6KClzXmYmUTXlMRhprD0Io1ifOJGoshA=; b=E5SuUAGXxiuknUVGzg1nbuo+F5
	N8GX25CGZGh5JgdAo0AaE+XHH/XnM5XhpnvzuIljkDyGe6LIElOG7XVrp7NW5/I5Ygo9LFTDl0yXg
	Wy79lYh60bBVjpHCVoIKNtzyN69wjUQGSJgqqD+X4VRBS6QRPZC+C8B5IntZl06NwtjocG3kmPX9L
	Tc5BKj98Z7KvB/CWR4+yMfrAGGgPNk2Xa76dkdRiubyYKB+4zQi4uEN2N/PXnJI6pgzoqs/C141vv
	o7KbHnr20H98G5sXyXi2hCWLFYQS5cniUWsL+c2fSGdFW49vs8pjQODKWkl2GIRRyNtvuY2m034kD
	sigapWfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l22Dk-0002Vs-Ih; Wed, 20 Jan 2021 01:23:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l22Di-0002VE-W0
 for linux-arm-kernel@lists.infradead.org; Wed, 20 Jan 2021 01:23:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 36A2F23109;
 Wed, 20 Jan 2021 01:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611105816;
 bh=3XMp7r3uwsQPIvU9HuZsSm6jBJjP8EZw7eroKIDWj5s=;
 h=From:List-Id:To:Cc:Subject:Date:From;
 b=mzhYw11IeJeEErqAzmELFc+xdO4K+MdeCeUhkvqpY24RHsQhoTl79B632iKGYnxKM
 kv6/AQlx77HCot49laifnxenF1x+SuO398ANUdPML6o7bfZH7IdkhpinlzHLK5WRC+
 t+w4VyWa7GRAZsHMAdLQJEdN0O+TlDyiCOaHioHf3ruXs6Vf0TjqyfS+h6C9A18dBv
 X+W1JQypPcS6UPK+NnTV7oCRvlugrR81vOoGf+5edP06CkOmWCzYaTvWjL4ltCXI35
 Aawyimt42fzhtai6G5RT9XJ9kp5DEn4l+wTJjaQFcXMdC1Gxoug69wM/LeopDyNyN6
 02h21nYqC54iw==
From: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Subject: [GIT PULL] SoCFPGA DTS updates for v5.12
Date: Tue, 19 Jan 2021 19:23:34 -0600
Message-ID: <20210120012334.25730-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_202339_101965_6EE2B67F 
X-CRM114-Status: UNSURE (   9.77  )
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
Message-ID: <20210120012334.UmRfN2NgQfX-xH_NW_4K0SKiNlguLEEhooKufAkMO1E@z>

Hi Arnd, Kevin, and Olof:

Please pull in this SoCFPGA DTS fix for v5.122.

Thanks,
Dinh

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_update_for_v5.12

for you to fetch changes up to b82a27075a0402386ba61c0404b47b69e7dc7911:

  ARM: dts: arria10: add PMU node (2021-01-07 12:30:00 -0600)

----------------------------------------------------------------
SoCFPGA DTS updates for v5.12
- Add DTS file for eASIC N5X platform
- Use generic ngpios in GPIO entries
- Add PMU node for Arria10

----------------------------------------------------------------
Dinh Nguyen (2):
      arm64: dts: n5x: Add support for Intel's eASIC N5X platform
      ARM: dts: arria10: add PMU node

Jisheng Zhang (1):
      arm64: dts: socfpga: Use generic "ngpios" rather than "snps,nr-gpios"

 arch/arm/boot/dts/socfpga_arria10.dtsi            | 13 +++++-
 arch/arm64/Kconfig.platforms                      |  5 +++
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi |  4 +-
 arch/arm64/boot/dts/intel/Makefile                |  1 +
 arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts   | 53 +++++++++++++++++++++++
 5 files changed, 72 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
