Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5893C942B
	for <soc@lists.linux.dev>; Fri, 29 May 2026 10:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780049730; cv=pass; b=SX+RcRN0RSGpOMw+VoYFIT/ihyiNvetsWV4oAvoXU1QEacaZ7PsSXrOjgbCrDkWX9sHiUPffKNCpMgpOlOr4SDwHuRBbTxwYxSlYIPJq3fidezjp2H9oPSyX4LsQwCOjEtNv2pnGbC4z9f1vlOYQYpiKKLfWzM4QeOtjtjEWglY=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780049730; c=relaxed/simple;
	bh=u+TxELakUQvpO8/ZwykzhJX+RvlzZygF5YDeBq14kdQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=cNVy4qMI6d9pZcaCQkl0rSRCjLU1x4qV0VcEvWD+VP6tf8PDjWMSn2VjGx96U5RoWRz+Nz4TTJ2XaqqLtwGgK51M8iAr5p+wXqQdNdXRFPHantbzu/jwixjNa5XdZo+0dhlJoXrHTFXfvPOfuHZR7dnRZaZg+l9EsUZymz3kHeE=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b=P8B8Za/4; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b="P8B8Za/4"
Received: by smtp.kernel.org (Postfix)
	id 3B8621F00893; Fri, 29 May 2026 10:15:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1780049726;
	b=JfSdveRK2OJtP4d9Bp7XACwBDbm8fxeZrvNtH2iAOeBtg8iHnddA2UDcHVf22npn99uH
	 3EXlSxVDqQ3xTG/1rPvMVchF/AHYI5YW5Sf0U++YDnue4ZFtHtHJLYGPQtZFGahsc/56k
	 DnVueV6XRAUjYPX2gnDPKBCYA/VWDvAz0fBIvcWEiJ82RbS+A3NRodvYJ7+aMkygQT2Zh
	 NVTc7Uyay3CZbnDvgcAuI/HwtFGOGi0cVSLFaLep6qaTUeIiStzvSIaaUlMPHOhLTbTna
	 9nUv4Btnnrq2l4SmilDSHzjUV5fEDhXR3k86oiVRnZaoR4LBmo35PyukUmYwcZ6KU7g==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780049726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=Q6nxMY8baHQ9SXUgo7tcneXPgF65eVlp4HOdZrI3XL8=;
	b=ux6Bb675qbWCZjankfeExsyAvOcGgmiYbefMXeGnwJNgtuVUsbP42N1W55Vv07fY7nZt
	 9GMAKK4CnZvtZERZZNCkfin8rL4XL1AC2rf4f8SYqjv7xXDwrE3xre5VxBzFmGsHXtU/y
	 LXJLSmBHbhhcPJ+3J14VkPajcVykPoSwdqG1ALvO1L3UTcaG1eJas5r0lPzhcI9KXuyOT
	 6wIIqW5sLfvuRWmBbdQnmV96C5Zmrz8VMKEe2p2uv0XYFTgrCXFyB51rF25ccrhC27zx3
	 lNCbOxG3/jxr3QYNtIh0dRfpp/4Nwq0TE0T8Xf77+ju0pZcnWLW1KmLXFFA0SpGaNPA==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b="P8B8Za/4";
	dmarc=none header.from=monstr.eu;
	spf=none smtp.mailfrom=monstr.eu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 556701F00899
	for <soc@kernel.org>; Fri, 29 May 2026 10:15:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=P8B8Za/4
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 556701F00899
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-66039d3efcbso2398478d50.2
        for <soc@kernel.org>; Fri, 29 May 2026 03:15:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780049722; cv=none;
        d=google.com; s=arc-20240605;
        b=aDzLac0+2SNWGN/t9fxDOfJffm8+HlDvugGtTHn2ycp4a2n2012wZGONNnzKRv8cl6
         nM/FzaTAgs8RmlSxBVXwdAV0L+ZXPJCcAGRN8xcWzc3ZR044vfmPWfxdey6aC70yziCm
         OleQkAsKTdznozjqOh1DNV84oPFBKMQJ653OYF3WHlkTD01XQHWdT53Rn6d5bgnJSoqp
         MGpegYsp2ZQ+46YACoPbquLoIpZh+hli27eEN3EBApdJ8KN0w7Gp139vfpHRlZqvI+bK
         +oh7EOwkRMb4P60ObxX1e0ugt5vNk5WzoXJcY2JcqfEO+t5K+4o/BGvNkUm6zUti9osW
         UJ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Q6nxMY8baHQ9SXUgo7tcneXPgF65eVlp4HOdZrI3XL8=;
        fh=ngnzniW9/251Blo+3H7OvJM/allDljIxuXeYmmxYfks=;
        b=IIKT1GXn/rBdjQKVhzBHSFSyyPBG6667OBQwyg8If/3x4VSRH5wufiy1jrx401ajWO
         7rN7NJIMvUnxThmsHvZqf4WNthKOJq+8D7juVgu9RO89ZtwdDyy9Dh4rJlNJ2uAxk7dc
         kbhG4OMbGbJoqHtJhSzZH5jecLfo3VLvPsi6RTLAmeA4/oq+Pvc3REFW6x7jc8ttWOOy
         nbKiAuRhE899h1I24mJTx/USrADoRXN5qVC5/IeZ6ZvSrm8b9N9EgHnqDOe99D0AXkb4
         GxmiLxykHqVfZx+eY/UKeJ6exLl0Sp9krdNNsVe0gHsnHbemwOP0JC3qTF3HDGt9FY3Y
         /XuA==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20251104.gappssmtp.com; s=20251104; t=1780049722; x=1780654522; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q6nxMY8baHQ9SXUgo7tcneXPgF65eVlp4HOdZrI3XL8=;
        b=P8B8Za/4rrmlaF7peF4TaN8DDDc88zgE2y+M0XruHwKbjdxFFwBIz8/n+WPa7DbNTf
         fdS5eCXxwAdGBe8a5zzERm/Ba30FWQNDELV2HiZAov1RSDoAFjzh0IouDgZd1hibC08T
         qf0z9+a9djHqgQxOaonbgodbxnOY2Khd5sWQqTg203I/9mE2swZgADuUYxUXLIQSL6Gx
         u23Afnpv8tushCgBG/Q1P5+WP/pDe4INbRGtHyOPsoHwxhi0s0AabxUkOClXM2Cncdeo
         iFG6c/BYnBC4cxab0QQwqbOeeKIA99h3MwETmhHXuIujbtwPY5+PP7fVPwnfsA0pDLsw
         Iu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049722; x=1780654522;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6nxMY8baHQ9SXUgo7tcneXPgF65eVlp4HOdZrI3XL8=;
        b=AZ2RBL2mazzDL7DgT064Qmla64qu83n7lftKWnEUfbfrD6BMxWxLPHMP8bY+OzXwlx
         vKxZAZTv9HO15Rdq9RvMHO4kj8gxLQabFE0Xylme2ziVIH3g9Wr3gjB6pRSUf8uZlIll
         isI/5stYYirrnu9BY/uGtyaoAW6Dvmc5Lzqo13c4jkgaAUIZZcRU7LBE/2FwTclzKfxR
         IEWRhc+Zx2NtTRSIgCI2j3ee5s3J27+meOrC4glAFbl0YSQ0eDFCOZzLQmj4NRoPR34Y
         Q7r1hAONFXMMY0uFnrnhteAp77cfhl07b8h9skF2HoadtvXSoppK7hXQ/XwEdAwtQpZy
         fpQg==
X-Gm-Message-State: AOJu0Yx4EFM0YF95KCFL9cvagSkiYqkhqHD4C9cQoodJ1mbOvWjJYxCE
	jEL/wCGkyjv0IXRUmigafKp3mxHRVPKPmCxycDZ0/R9QgTMlqsBFH3o+f9skeieCjbMPkv6bH0E
	gLhJqbIOa9PrmVHDCRv2HZeiv09lhega1rwiZuOup0C0pFDPfRGGy5w==
X-Gm-Gg: Acq92OH+9txjhLiXi3YnC2vSfBSgmeosBLXK+WK77fknOkEzIJylJ6wYA4OJUnnVOEP
	gYuVYLkt35aHyk5lR6nmK9kFrkzNSrnxu8KTGQHojoxVSHpp/mJBRdggrshkajJ5m3riKxDK1of
	6oeKK4rKe5GmqTVNGzJkiQS9IJngNyB7KQ1wAi+IgObZUWQg5ge82+1ZfCiP0CUyWtN4U2L5D7S
	p+b/RZWXbubgKiraY7N7H4Dx1nzgoy8qX0EitDH6IwTslbBOisllJT8B0jCEewOJVGCD6eikVmB
	MTX28kClF/Mlb+M4Wv0BoTr9HRFVSvekR0B6r9YJW6dDgRwN/qg=
X-Received: by 2002:a05:690e:1514:b0:660:32d9:22c1 with SMTP id
 956f58d0204a3-66052ea82ecmr1238384d50.33.1780049721964; Fri, 29 May 2026
 03:15:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Fri, 29 May 2026 12:15:11 +0200
X-Gm-Features: AVHnY4Lal-FfaM_K5u9m3mttSbGCNbBaXcJ-9B1nzkzSgz-ek7xSeV5hmB4qamg
Message-ID: <CAHTX3dKWE6DOPLXPq31wRiXfjac0TVqSOAOLP8itHoGYpF9eBA@mail.gmail.com>
Subject: [GIT PULL] arm64: AMD/Xilinx SOC changes for v7.2
To: SoC Team <soc@kernel.org>
Cc: linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

please pull these 4 patches to your tree.

Thanks,
Michal

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-soc-for-7.2

for you to fetch changes up to 47d7bca76dd4f36ba0525d761f247c76ec9e4b17:

  firmware: zynqmp: Add dynamic CSU register discovery and sysfs
interface (2026-05-25 16:09:15 +0200)

----------------------------------------------------------------
arm64: Xilinx SOC changes for 7.2

firmware:
- Add CSU register discovery with sysfs interface

zynqmp_power:
- Fix race condition in event registration
- Fix shutdown and free rx mailbox channel

----------------------------------------------------------------
Prasanna Kumar T S M (2):
      soc: xilinx: Fix race condition in event registration
      soc: xilinx: Shutdown and free rx mailbox channel

Ronak Jain (2):
      Documentation: ABI: add sysfs interface for ZynqMP CSU registers
      firmware: zynqmp: Add dynamic CSU register discovery and sysfs interface

 Documentation/ABI/stable/sysfs-driver-firmware-zynqmp |  33 +++
 MAINTAINERS                                           |  10 +
 drivers/firmware/xilinx/Makefile                      |   2 +-
 drivers/firmware/xilinx/zynqmp-csu-reg.c              | 258
++++++++++++++++++++
 drivers/firmware/xilinx/zynqmp-csu-reg.h              |  18 ++
 drivers/firmware/xilinx/zynqmp.c                      |   6 +
 drivers/soc/xilinx/zynqmp_power.c                     |  47 ++--
 include/linux/firmware/xlnx-zynqmp.h                  |   4 +-
 8 files changed, 349 insertions(+), 29 deletions(-)
 create mode 100644 drivers/firmware/xilinx/zynqmp-csu-reg.c
 create mode 100644 drivers/firmware/xilinx/zynqmp-csu-reg.h


--
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs
