Return-Path: <SRS0=6JJP=QD=baylibre.com=khilman@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBB4CD4F4A
	for <soc@archiver.kernel.org>; Thu,  5 Sep 2024 00:10:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3DF3CC4CEC3; Thu,  5 Sep 2024 00:10:43 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 406BEC4CEC2
	for <soc@kernel.org>; Thu,  5 Sep 2024 00:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 406BEC4CEC2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7140ff4b1e9so158524b3a.3
        for <soc@kernel.org>; Wed, 04 Sep 2024 17:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725495039; x=1726099839; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L/J+m7xtAiLQbYPxO7KC9XqOGseWC15fR3u3v8pH/Qo=;
        b=3VrO6tO5UePa3e9hTH28LhxerR6zlPF/sj4BiwW+24QERWvI5OwpVWq3WGQeh7m16F
         k77uxLkLJANiMuFdpm8HYtVuyduu60zMxLtyzyY4e3nf7aYmd54KhK1ttv0/yjlqkYKz
         EpdvwlHlQYNeS7vhwskrpKVfDBkZsqN06J7JlUqqSvjW3k3YCHtZqqj6Dn+X7QnMyxP+
         mrbwmMSbW04ASH78VV20edBAJs1IMfrujC9hovoAZxNawEjGuyxD8VOUGwU+I8wNPUZC
         eL+uZAqh4Bc5JZ6PTOoJ/LEnpxpTIhLNqukUT2rS8vJnxMl6OxyXuBo4ULro0IPaoFsM
         03BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725495039; x=1726099839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L/J+m7xtAiLQbYPxO7KC9XqOGseWC15fR3u3v8pH/Qo=;
        b=Qm+uEaayGcVXqcxAW21pD5pxygey91wUXk+3aT/jLc+zx+7y/DRShw6U+D+SGgmYVV
         qRNKjcso3ywyis/NtqG2420b0TdMRvrG7B+6D8gRktL7VCJwv22e8w/pdCAwefkogwnd
         UlWcToazAlK1Iqhab57sZJ9c7neGI123ftaHqR3QS22A/+Vm1H3KFo53UoUfUNA6EoJf
         ZhQ8QZatij52kIHsyV6mqRYj3ZRjrPS+gt047rVp+G4Y4Ovy1msDHhqbXNKzJfcsuXl8
         sh/jQhz1JDmCJ3LJQEVXmOY+hDAyBgDqkAsCxlOj5MTVNPLqp8ljlVMAMJCg+kmcqQC+
         GNfA==
X-Gm-Message-State: AOJu0YwxUSmojrhLGkzbqt4h3lZNrh5D+WAI5iuKCpnpIUKQp4jSCjcp
	M4XkvX3l3pQ1e/TpfUl663BDla9YX2Bywa1V/6JzOa4wHRkSZgO5OgaeONTjxOhvwhL9d6Qn4In
	x
X-Google-Smtp-Source: AGHT+IFr8ZgCjKP12FAginmMBgyBrcf86BKu8ZxaYyiTyrv9SpdDyLEWBNbAAE5ds/o79vsyYkzA3g==
X-Received: by 2002:a05:6a00:cd6:b0:710:6f54:bcac with SMTP id d2e1a72fcca58-7173c1e0fa1mr15844982b3a.1.1725495038993;
        Wed, 04 Sep 2024 17:10:38 -0700 (PDT)
Received: from localhost ([71.212.170.185])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d501dde269sm1170670a12.88.2024.09.04.17.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 17:10:38 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org
Subject: [GIT PULL] ARM: dts: ti: mix am335x cleanups for v6.12
Date: Wed, 04 Sep 2024 17:10:38 -0700
Message-ID: <7hh6avark1.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags=
/omap-for-v6.12/dt-signed

for you to fetch changes up to 22644cc0443550258f8710bd1613d483f82e8196:

  ARM: dts: ti: omap: am335x-wega: Fix audio clock provider (2024-07-30 15:=
19:13 -0700)

----------------------------------------------------------------
ARM: dts: ti: mix am335x cleanups for v6.12

----------------------------------------------------------------
Colin Foster (1):
      ARM: dts: am335x-bone-common: Increase MDIO reset deassert time

Dominik Haller (1):
      ARM: dts: ti: omap: am335x-wega: Fix audio clock provider

Rafa=C5=82 Mi=C5=82ecki (1):
      ARM: dts: omap: am335x-bone: convert NVMEM content to layout syntax

Steffen Hemer (1):
      ARM: dts: ti: omap: am335x-regor: Fix RS485 settings

 arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi | 66 +++++++++++++++++++=
++++++++++++++++++++++++++---------------------
 arch/arm/boot/dts/ti/omap/am335x-boneblue.dts     | 12 ++++++++----
 arch/arm/boot/dts/ti/omap/am335x-regor.dtsi       | 10 +++++++++-
 arch/arm/boot/dts/ti/omap/am335x-wega.dtsi        |  7 +++----
 4 files changed, 65 insertions(+), 30 deletions(-)
