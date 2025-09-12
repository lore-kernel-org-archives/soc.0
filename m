Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4F517A5BE
	for <soc@lists.linux.dev>; Fri, 12 Sep 2025 11:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757676738; cv=none; b=VQToQRZjAxEj/lm3p/NVWRSdqTujN0Vbh8ad5/2drZh3B8Ir3PsGnBySZut8z6vajWAjrRZmp9tWgkaf0buBuSw8MoWzzIfI1bT0rH3c2FFMR3seK5WY9BwSqsoq2HGILIo0XNGPXTXLPtPo3/CssTMzQVtZRZ0AoZu0u1E2Uz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757676738; c=relaxed/simple;
	bh=vorBf57cl0jGnve7gAeYE2Eeq/xXfKDZYzIOepZ1KmU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=UzDhu8G3YVQXhipQcZ5gmQRXkCphnlpP2lDtvkF0vmTGaOQg+JTxiEhObr73OsSFHlJMniMemhUPUu7ctJvIVEX4dMdJjyvAKOmMsaAOo0wi1uNagQj384cNz6V1sJMv6HcKwmRGoTaywvg4bBjR6QWwTxqpeM5oxbJDH+DRXk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=monstr-eu.20230601.gappssmtp.com header.i=@monstr-eu.20230601.gappssmtp.com header.b=ax6ICxxb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20230601.gappssmtp.com header.i=@monstr-eu.20230601.gappssmtp.com header.b="ax6ICxxb"
Received: by smtp.kernel.org (Postfix)
	id 72E7FC4CEF4; Fri, 12 Sep 2025 11:32:14 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 080A8C4CEF1
	for <soc@kernel.org>; Fri, 12 Sep 2025 11:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 080A8C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-72ce9790acdso16927597b3.0
        for <soc@kernel.org>; Fri, 12 Sep 2025 04:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1757676730; x=1758281530; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eBXExVx/skyVuxBkLgYtW7V7lv+BvFxXp4wcixH7FuU=;
        b=ax6ICxxbTV0dW7qVqmMluybvKo4KB0flEfmYtGGaTlZ7I5tbIRajE7yCbfdMVZvCkH
         Mr7fGu5gryMTk4RQvPBU/c5ocdJuxvIV3LfQWvdAAz4lfjM7oyO566VEMhyj67aAdB/Z
         ot6nLOji9HviEGvaa+Z3UuinaAuMEOUiR8Gm5NVjRLG5xFrSmxhNRof1NtCHOCwtNSZg
         tpBDKDS9rRqaR13iRO7rGPNJlTYn4oM6BFvwV2zYRJMw30GcWrlr7Qr6WxAjGLo1qu4g
         LxuYOnDNykOb+Z616F6u4N7Axf3yaP1x6XvE5plwS39bfL884KYDl4MCkrk5PkPwrgKk
         LNRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757676730; x=1758281530;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eBXExVx/skyVuxBkLgYtW7V7lv+BvFxXp4wcixH7FuU=;
        b=U4tjtQDgaCze2jCwrBte5cv+77Hs6FivHHGVqhQz82Euv1+mIaFWjZCWADlGZyQg+W
         O1DpmJvsOcvYbk5ybjKr25BsI9X+6WDuzp7A4jI1irtTMnPtc+SbJQyc+wUw4rt5kBBd
         v0GfuHa/GOUhcJO5Sln1ERkylyHCzapsjcegMRt2y/IvrgXoZaK6lx2vyti9AhaeBJDt
         /CoaukN7gkWU07LMmP+8rEi2MD6/GzvYiRLcD6ZqsYyrKkFjRNISW1ztaoNCQvbQr2/W
         BTwd+5fZdAROj0jFgMgEL58zqleb2hB5/xyHwUHecQaDqmzuL5bL5W77K8Ar4R+uAEdL
         1+1Q==
X-Gm-Message-State: AOJu0Yx5I8IpVF9+AmXWKKv6czSniV0EXhg62I+vA2yebd7eby21NLVK
	dUEXpTFB9zaMZoHaTwR+iiCJIYAgtXC/Coyn4Bxtaublnhow8tnIWTRIHhRpA9/eedTPE34nudV
	bDlpO1NTyGb3Cvp9+lX83oPhqogZEELjBWkyg4OYXain+VVXYOgxSnTYmEWU=
X-Gm-Gg: ASbGncsuWtz2sDFzup2eehEwIjVk+PRlawnGyiBf+tyXMomolIs/1PIAKofgqBXDNZQ
	LOtzi96QBUng50O4SM0e4aZbzRa7scQ1X4kwVIaZ3Hx/qvGgSSXZ8P5frlwMTDQ1SyvlsUE8CWl
	Mx7UV2LViuVR49/SJiPyQIoTfW5LXL2xZQhFSGuzvkDy/EhazmXM7WzhUtYavAsqa90U7FidMVB
	uRGdcDvPPQEPd2YhTo=
X-Google-Smtp-Source: AGHT+IGkV4eMTlmi1qIVJNb1Wgo9JEzjXKTSYr0Yjf3dFzylAi43wPNWTdbdjzP9g3W9gpHIH8R5jXRIDhjMa4QGIv8=
X-Received: by 2002:a05:690c:4484:b0:72a:530:e40f with SMTP id
 00721157ae682-73062ab836cmr20845047b3.3.1757676730353; Fri, 12 Sep 2025
 04:32:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Fri, 12 Sep 2025 13:31:59 +0200
X-Gm-Features: Ac12FXzAww08Io2NnWWmI3cEKTVoSzefAeq4FZmqje9fk_DJ_BH9j-DAAlYvzR0
Message-ID: <CAHTX3d+aQHxzkGSseB5e7m8fr5YTKQL4CMoFZF_yXgR_CdATLQ@mail.gmail.com>
Subject: [GIT PULL] arm64: ZynqMP SOC changes for v6.18
To: SoC Team <soc@kernel.org>
Cc: linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

please pull these 4 firmware patches.

Thanks,
Michal

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-soc-for-6.18

for you to fetch changes up to 25e3ae0ce364fa725a6eea68d63d6a2ee09e019f:

  drivers: firmware: xilinx: Switch to new family code in
zynqmp_pm_get_family_info() (2025-08-29 09:58:45 +0200)

----------------------------------------------------------------
arm64: Xilinx SOC changes for 6.18

firmware:
- Add debugfs interface
- Wire versal-net compatible string
- Change SOC family detection

----------------------------------------------------------------
Jay Buddhabhatti (3):
      firmware: xilinx: Add Versal NET platform compatible string
      drivers: firmware: xilinx: Add unique family code for all platforms
      drivers: firmware: xilinx: Switch to new family code in
zynqmp_pm_get_family_info()

Madhav Bhatt (1):
      firmware: xilinx: Add debugfs support for PM_GET_NODE_STATUS

 drivers/firmware/xilinx/zynqmp-debug.c  |  13 +++
 drivers/firmware/xilinx/zynqmp.c        | 114 +++++++++++++++-----
 drivers/pinctrl/pinctrl-zynqmp.c        |   7 +-
 drivers/soc/xilinx/xlnx_event_manager.c |   8 +-
 drivers/soc/xilinx/zynqmp_power.c       |  10 +-
 include/linux/firmware/xlnx-zynqmp.h    |  30 +++---
 6 files changed, 128 insertions(+), 54 deletions(-)

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs
