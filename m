Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D111DA2E0
	for <soc@lists.linux.dev>; Tue,  7 Jan 2025 08:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736237675; cv=none; b=MGMTWLloFZK/oD9n7M22XR14bXiiuq39+cKxhBYkqVtutnyk9rOxktaAM1MxIK+3H/MMTFQ7xROCxd7eCd5BWtunnC7F7vw+804hXn1eM7mIp6mCH6/FDnJfw0zZCc/BBLB2mibQYj5l+9C/P/8t6iyJgFE3ieUFB9sbYF+bs2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736237675; c=relaxed/simple;
	bh=wEfpMVx4FVFRTZvx01PkXYEi/mf+JfGMaqKf8lFrkjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RyuG7KVZL0cT+Fh4CZsng6DhlwsL0cMXk60tC1dxlSGsj0Qb7/l9ZGs21L2KlrthAaerTz+0wEI0lKQkiestDb9mRmM1oDIqKXar7/M0zHULOYZ3s2l8n6OWqmHhSDo2bLaDyAsu9t/IQbDp1AIFaLWeRgz4BOJsdUVSe48BJvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=NazAE3jd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="NazAE3jd"
Received: by smtp.kernel.org (Postfix)
	id B9326C4CEE0; Tue,  7 Jan 2025 08:14:33 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9EEF4C4CEE5
	for <soc@kernel.org>; Tue,  7 Jan 2025 08:14:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9EEF4C4CEE5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-436637e8c8dso154379745e9.1
        for <soc@kernel.org>; Tue, 07 Jan 2025 00:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1736237671; x=1736842471; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXcF/zg8iZUBkhFDZzmxx+J2cDTkM6h59kKvLz1r0as=;
        b=NazAE3jdJPjbK52FnUGMwRnMq51+ly8YRhbglH3dYkC6ImUEyfXC7hRxz25YYCNLNi
         Zc/eJwcCCotpD2b/1is7dW9A7+ujnsLH2Antc2tSHHyVmSf8wY+OiW6xYBAbGEeYbN2B
         gzGF7Pj2QdBVE9SE1rhbgQopk4JH4rMv2bSDxHARRuhIIxLA2XNIZ7FozI48qEI5w0GL
         2iolVrYcmNj78YK4y63aWQjDQLni9fg/RLBsuJo5j+BXC6t1l7XvUL8lH8rdim3xUu2F
         HtXsq4FaUcBZZJdSqnzPuNe476VM3YeFOK4lk4YTbTIx8hPss5I8UbJAQaN2rRbI4mTG
         tTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736237671; x=1736842471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gXcF/zg8iZUBkhFDZzmxx+J2cDTkM6h59kKvLz1r0as=;
        b=LmxBiFWmrCp7w0Iv03hIcVYh/rKd6/tDHhT9c+oGadmsfxR2eiCVKxIpgkTExyKPjb
         8yfFtfeItw+11kxpFB0NTlyR7u4bIKIglEnQ+zt6LLA8VAqOHfWv4pJMSNvmvKWXf6Iq
         72iBCAr+qDgkEWQiDX7OWo9Cfve1ZzVZK/Pi8C7MdO/+xhLaepYkH5H94GPxRDuirjNk
         5IMl5JnSWyiilSdsEfpftN6TYJlMnzb7Xj689BkgQcX/ObN9ncMGs5Wl/dGAQGfFM5Uf
         FQg6sRRo3X0RSOS64mFBGKh0PHzUqIF8TV+p8itJSmG2JDE5HxjhrjLnf07S89TC7eAI
         jEkg==
X-Forwarded-Encrypted: i=1; AJvYcCVlwRFZXnNMZRTcNjoX4cjSUmkjFmC3Q4oPxJaJrp/eSxK0yl7idZB9svePgTV0QKz8Mi8=@kernel.org
X-Gm-Message-State: AOJu0YxUL4PmYmbHtPqRjdWfGDPgt0BGiq9fhjdmaFFvgUs+jGLOQv1G
	QAbZeGvKEsobFL0Rs0mf0L16ldO2uD+b4fr813p8fHVJDMSyBdkhyemC4OdVhsc=
X-Gm-Gg: ASbGncuQqt7tTsVigbFkYDKn5huzNwPph61QXD/O4bZIVyuSbW2YYZcAAMCGLU09Upu
	eBi3OzQlWTx+pZdvfqkTgpaJ00/6q2C/mbSG0jDB2XUp+4Efj7ww7hAof8OJEf006Qs6OPH/2e+
	7VGua3QKWMRKajNvwpynruGcykTYGeUK356pQxdUkHgSS7gz4X3ICa8KRhiy2G6NWtsFDyqTySa
	PLivEJEDaWoIo5OJ8M64yOI/KpL9n4bEndFFmZ25HUQNy9LRo2DhmlrMbuXW9Ow9rqRyyxRterm
X-Google-Smtp-Source: AGHT+IH7acLezt/XoaaQVIdn6IgtSq2a87yjQeYiM1StsMAqE09iPlejhkyAkuDB+tNY0i8edcwdsg==
X-Received: by 2002:a05:600c:3b20:b0:434:fa73:a907 with SMTP id 5b1f17b1804b1-43668643bccmr506037945e9.13.1736237670709;
        Tue, 07 Jan 2025 00:14:30 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a75a47943sm3541314f8f.87.2025.01.07.00.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 00:14:29 -0800 (PST)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: arnd@arndb.de,
	olof@lixom.net,
	arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com
Subject: [GIT PULL] Microchip AT91 SoC updates for v6.14
Date: Tue,  7 Jan 2025 10:14:24 +0200
Message-ID: <20250107081424.758980-3-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107081424.758980-1-claudiu.beznea@tuxon.dev>
References: <20250107081424.758980-1-claudiu.beznea@tuxon.dev>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-soc-6.14

for you to fetch changes up to 452d18c78a469cd18b3f7bc7bc9427f9af390f7e:

  ARM: at91: add new SoC sama7d65 (2025-01-02 12:30:01 +0200)

----------------------------------------------------------------
Microchip AT91 SoC updates for v6.14

This update includes:
- support for the SAMA7D65 SoC
- support for automatic mode in the backup unit power switch, eliminating
  the need for software intervention when entering low power mode
- a fix to release a device node reference in the failure path of the
  SoC driver initialization

----------------------------------------------------------------
Javier Carrasco (1):
      soc: atmel: fix device_node release in atmel_soc_device_init()

Nicolas Ferre (1):
      ARM: at91: pm: change BU Power Switch to automatic mode

Ryan Wanner (1):
      ARM: at91: add new SoC sama7d65

 arch/arm/mach-at91/Kconfig | 11 +++++++++++
 arch/arm/mach-at91/pm.c    | 31 ++++++++++++++++++++-----------
 drivers/soc/atmel/soc.c    |  2 +-
 3 files changed, 32 insertions(+), 12 deletions(-)
