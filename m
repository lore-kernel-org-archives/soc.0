Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F23AC13C
	for <soc@lists.linux.dev>; Fri,  1 Nov 2024 12:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730463643; cv=none; b=TQqZg9NBNWANXhMtAHToyZcs5wF1WFhgRSZwivLTBRn3SLLbLP1EK/iCBketbnXJkRixIretviRvUQkYJ5304gRFbWv5zd72Ke6mI4833jdxoOm+cnk0r/bOb2prGOaH0j6HPjZAa0jjLtgFko2YdSZtBC9PVqhlPP/QB0LHr0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730463643; c=relaxed/simple;
	bh=Bud+3iUgsmtQ9EPJnDthjvWTbE07ShaLhl7O4s8dWr0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=nMIsdDG3RhFwwV2n0HWMwz00GtvF1i3dkuPCWNtIC6g6mTJQnBUo2S9pf/7JwIidzARNLbMFYwuahYgg2ULocla74ld5CENdEmMGMsF/t0i84nMmD9/Hvhj2YiP+Rb1kCl/RUhLC5LD6WeTd/6TCHh4W83Gg5H2LnUp+/1xVARo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=monstr-eu.20230601.gappssmtp.com header.i=@monstr-eu.20230601.gappssmtp.com header.b=PNB1hIGs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20230601.gappssmtp.com header.i=@monstr-eu.20230601.gappssmtp.com header.b="PNB1hIGs"
Received: by smtp.kernel.org (Postfix)
	id BE5C1C4CECE; Fri,  1 Nov 2024 12:20:42 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0E3A5C4CECD
	for <soc@kernel.org>; Fri,  1 Nov 2024 12:20:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0E3A5C4CECD
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6ea0b25695dso15550307b3.2
        for <soc@kernel.org>; Fri, 01 Nov 2024 05:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1730463638; x=1731068438; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BiN29CI2quVy9Vm2GzAx3LhypcTi59G2l37bGW9+GCk=;
        b=PNB1hIGsWHTFsvI/VPa5lDvIb2B117jMbLG+2sQgThl8VRVGFaVdhVV7kJcHPHEQRZ
         uC5ZGXOlSSfT2kvgvFTf+PzIZ8d1xkBgjbr7ESW0Cyj8nJIFL6aDBRdJ5b52f1ER6f0T
         ZQABrA5n9U7gbqLsTEL1qFRw9mXVmZhKqxFsns98fMMyDxkdDJgVAysV3gQwcJFiGrfl
         5H0pDIJplr17v32MYnwMcCriyWbEBBkcCv37UWNz2qYlx3SG0PEsv/nJWLShx1wO3ivm
         0WUn1Ag/Stl3unjrBzA/Mxujsue55zAgNHj9pAvUNKd5Xz1PO4f9oQd08JLex4AZ906S
         JBSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730463638; x=1731068438;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BiN29CI2quVy9Vm2GzAx3LhypcTi59G2l37bGW9+GCk=;
        b=Hl6fvRD+6JyrCfH+lfi4Q2HgePiQsidWfbmLfPreuQCMfLxtulebN1dhJQ5vT6oUpW
         25jagyugThuGPhB41/sYomyr8xlG+cGvXD4i70+FU2PT0jG+7GtFnCqd8z+4cGie6YBc
         Xs8UfFJouM3ujd+HzM/Ek/22lftzheAAENOSEY+bY8h+Xfv+RWOjB2agE+48uYxxq9ac
         /ALZfD3gQ5XbJ1EhI3xcHHnOs5p9afG3XXns5p8cCPoTxBblDGhw0kxMgssmBtDeKoKh
         n2V5CQ9h3Hsvi5bNZ/tRFq5GSZfpxPUr+EqALWWFD6Oko0glnLQsROxicmAgoj2yVvA7
         Z67w==
X-Gm-Message-State: AOJu0Yzb/WN7hEloFDHgEoTlbbr58dCIigkI3Drp1WYw+LzrC3ryLVrT
	HsNvO6/SHIWHnHn3I+iVD6BJdv9O65S6xZI8HZYlzo31ndJDK8+DDPHfTtxZEl8yHX/p0pfyJaY
	Ao/Wt4b16VWCvFu4QT+cb/cqriYmx99nF7oRH4oDnQQG1QlzZzupD
X-Google-Smtp-Source: AGHT+IGiatrvMrvxZscERsQ21uX2HkHIP+GuHqrpYy8p/qFDcGOHRnNAk7qOgs/wRZs4lFQ8e52gaucLrpreO4x2Dhc=
X-Received: by 2002:a05:690c:2d08:b0:6e3:10e7:b418 with SMTP id
 00721157ae682-6e9d8b554acmr161862977b3.46.1730463638444; Fri, 01 Nov 2024
 05:20:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Fri, 1 Nov 2024 13:20:27 +0100
Message-ID: <CAHTX3dK9PKmG_UG4MW=x5KmZCrd5PkcAZiNVgPFQ_zsPRgu+dg@mail.gmail.com>
Subject: [GIT PULL] arm64: dts: ZynqMP SOC changes for 6.13
To: SoC Team <soc@kernel.org>
Cc: linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

please pull the following changes to your tree. All of them are
related to the firmware interface.

Thanks,
Michal

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-soc-for-6.13

for you to fetch changes up to 55ed774d0130adaa4ef12aefeb8e0638011cbe43:

  firmware: xilinx: fix feature check logic for TF-A specific APIs
(2024-10-02 12:55:51 +0200)

----------------------------------------------------------------
arm64: ZynqMP SoC changes for 6.13

event_manager:
- cleanup error path

firmware:
- add support for new SMC layout
- fix feature check logic
- extend debug interface
- update reset ID format
- report about unsupported feature in pinctrl

----------------------------------------------------------------
Gaosheng Cui (1):
      drivers: soc: xilinx: add the missing kfree in xlnx_add_cb_for_suspend()

Ronak Jain (5):
      firmware: xilinx: Add missing debug firmware interfaces
      firmware: xilinx: use u32 for reset ID in reset APIs
      firmware: xilinx: add a warning print for unsupported feature
      firmware: xilinx: add support for new SMC call format
      firmware: xilinx: fix feature check logic for TF-A specific APIs

 drivers/firmware/xilinx/zynqmp-debug.c  | 162 +++++++++++++++++++-
 drivers/firmware/xilinx/zynqmp.c        | 153 ++++++++++++++++--
 drivers/soc/xilinx/xlnx_event_manager.c |   4 +-
 include/linux/firmware/xlnx-zynqmp.h    |  39 ++++-
 4 files changed, 340 insertions(+), 18 deletions(-)


-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs
