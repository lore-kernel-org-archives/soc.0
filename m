Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03637214A61
	for <soc@lists.linux.dev>; Fri, 10 Jan 2025 18:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736535253; cv=none; b=Rou8ytG8WpYLzPDgWaktZ0ROJ244XbMNk76+rpQpSYLq3Xcz3t3Y1Sg07mkknn3zc+dEydAg+8vkJlSuQsJjblvBMg0zKB7zeMmVKIldTgxTxGkymaJnX75TpIT19ZzkdKWPXFyXUXUGPwl4iXJ02m+Ek6bRyvRrKgSx9ZvkI3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736535253; c=relaxed/simple;
	bh=lgZ93V1ZItzIfHK+oQnk1OVdB2OMfuCTvCgeEgjvxXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RPWOLTJMqgh9joyfFceLhx769VahaUcS7+HRZpsmR2zVzv9APyD+zfS1/ICZHlNcO9JgRK0JxyYDAVeyqweLhWL6oyDjf8bF9OPqEQvZIoAQxm3dusxJehYSWTD9J3DI+1NgkkLIZ7WXLEWfM7RoWig43TIDVHuECKwH/lDhmBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SX5VQ3Vl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SX5VQ3Vl"
Received: by smtp.kernel.org (Postfix)
	id 9C9DEC4CEDF; Fri, 10 Jan 2025 18:54:12 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C9C60C4CEDD;
	Fri, 10 Jan 2025 18:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C9C60C4CEDD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38632b8ae71so1666643f8f.0;
        Fri, 10 Jan 2025 10:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736535249; x=1737140049; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pPmvp85D7YhG3ldAMLMgkFeu1ZL96pzTRc6+3VKf0HA=;
        b=SX5VQ3VlR354RjbEFLaWTXrQVQoBRbwi75eDYYP3SAM69HGLp/cjWDAh0UJQLQgbel
         jWc8uSTA8mag+WC9L++YkRDC1DQckywC1IpDgqHTngMAdUh2mIPofPEP1wBCdh7+Uycs
         yKXOe6PVZVNdW5r3hBrHjIFGLdQ6TQFwp47KDyoWMSPgmQIyLke6OBmH6eJ5dclJfQyf
         /MRvREMXuRMhdbIbpe6oTS0ybpxeK4qab2YWF9dbcx3/kuE0NL2CGvVL6vYY9rwbDavS
         ymOLk9egTbVIKpX3mHKGosw1Dzxpd0MX5jlc15usTEMkt9OCfmv7/JjqW1PBm0q0YoYk
         99Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736535249; x=1737140049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pPmvp85D7YhG3ldAMLMgkFeu1ZL96pzTRc6+3VKf0HA=;
        b=HONvF0LBi76oDdn7osQ22QI3EvF1Ld34H9qm8cRzk3K49wmtpuA2dTs6pT5WOD9Gi6
         xpevLKmTw8M7WhpcGm/fHFtAACYcUyPCtTR04RrVb0PJvRNqfJHdGQD3arYg6u8+T6NO
         1G55tLRfwfCROWNh9UxhbOqe/U9/8b6nM4gqDEZxGdnP4fJ0Hu6meYps/zGZk3pq3OAy
         mo7QzBwvJoMVVbJO6QStVeZk1ky0UUsJ5aPbMCBZBWVe65Rire9oqTrIx8klOsolljCf
         3F76HGmT1qooRAP1Q10XjIIHwS9jFwWGbuCQLCUPliVTeHb4X6hFx6GWFEQYhrfv9x1t
         +nlg==
X-Forwarded-Encrypted: i=1; AJvYcCXiVKpnCSyaic5MIUyceaX4Zp9K6kceBWEJBAJjngFaRFiRIaM4iGVqDL0Lu15IFIygIi4=@kernel.org
X-Gm-Message-State: AOJu0YzUq9cz+stnFMtQvWgguzIr6bD8+nKVvXJfCfA8JLfu/jzoel+B
	ev/8OjkL/XOyA8ABdpbaNXNUf0doKYjQG41+X0lPEK5w598u2B7dEKIkEQ==
X-Gm-Gg: ASbGncsaseYPz7s9ppOtlUdaSAN5BfVMTJsktIzt0W9vWYNHKUdY1Hy/Fjh16k/z+/P
	ywPTuQpfbEJ3fjhPu3a7MnxfobqeH69MF3cuquLhDQF3fpu3CMjtLv30WISnJphdsmU3cY0DxPu
	q1+hTxRtYvcKmY4znh4GkQpatQ3K65zbp5AmWUoB7/B/uJ3LgUlTk9vN71M9qkbDzpbQdXnAvm0
	5Ddiz27usJKZ9Q2E2TgOkSmEZCZq5k1jIq/HyxcwtVRTzCg7V2me+19DugnP0M3rwiLgKvJFUxX
	STvw3Wi1jxD+r7PjR8O1QuJoQGFhLIF0mDzmbcVu0f8YiJwW
X-Google-Smtp-Source: AGHT+IEFi3PtPR7G4voP3OPwlBAD74nU6hgLY1gXbKic/LuJz/motUj+soaJ5WE95z00Ob/Xtqkqjg==
X-Received: by 2002:a5d:5f82:0:b0:385:e9ba:acda with SMTP id ffacd0b85a97d-38a872fc177mr10677053f8f.2.1736535249366;
        Fri, 10 Jan 2025 10:54:09 -0800 (PST)
Received: from localhost (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c1ce5sm5291450f8f.94.2025.01.10.10.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 10:54:08 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/3] ARM: tegra: Device tree fixes for v6.14-rc1
Date: Fri, 10 Jan 2025 19:53:52 +0100
Message-ID: <20250110185355.4143505-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110185355.4143505-1-thierry.reding@gmail.com>
References: <20250110185355.4143505-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.14-arm-dt

for you to fetch changes up to cec785a7f25d9ebe3a151ddc4f3a4ede7fc0dab0:

  ARM: tegra: nyan: Maintain power to USB ports on boot (2024-12-05 12:42:06 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree fixes for v6.14-rc1

This contains a fix that makes sure the power to the USB ports is
maintained during boot. This helps with booting from USB storage.

----------------------------------------------------------------
Michal Pecio (1):
      ARM: tegra: nyan: Maintain power to USB ports on boot

 arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi | 2 ++
 1 file changed, 2 insertions(+)
