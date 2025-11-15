Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F2D246768
	for <soc@lists.linux.dev>; Sat, 15 Nov 2025 09:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763197267; cv=none; b=DLVpn/QyOaZTyvpuPmq4rQs5kuMsi6b5z8tRn6M7TPgOXVIxZkBEYHs6VukB6l+9Vo+17hnk9znfT/6XVCUU7SLYKCH7f5gyjnX6dCrS45lNib51POyNwUnwubXW+ACF7dEResRnHge/tMQlela4S67K20ZNq/hyGKMiePM/Jqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763197267; c=relaxed/simple;
	bh=zv+maFz1rZ05C01gYlLfTBLLNcYvksJP/DD9r2XuRq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C4flcJTd1vi7nq9BKAO9cD4rn8irT/jwlisgf2GrhO9CUm4dDjBPdn1j7Gs8dmxFAwsp3tiThhN6ap6VGGr5QPIo+Q3yJlflxO+Jy+Y/Sac01GXlpFo78eCma4X3ZIiKj/Da0UNXFtzlfqok9gOUZWWUNHqjFV1eWih73/g8YHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SX76DXzd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SX76DXzd"
Received: by smtp.kernel.org (Postfix)
	id 74F3EC116B1; Sat, 15 Nov 2025 09:01:07 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BC013C4CEF8
	for <soc@kernel.org>; Sat, 15 Nov 2025 09:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BC013C4CEF8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42b2a0c18caso1484528f8f.1
        for <soc@kernel.org>; Sat, 15 Nov 2025 01:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763197265; x=1763802065; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0ZwHP0w/ZzXX9CPFHfzkBVRDrGDiIy2mewdqadHPqo=;
        b=SX76DXzdCdmKY2H+nwOAH3eFaH/gN0HwWZfGjcvmBAYS63ysfnM2GyhDn7I/2bjQ9L
         DmaGVXyFEfNvyygjdoXajW39zu6f/XRGMwPEV4jvRjbeTJuluMxven3AashJoKWDeTOX
         YXt89GqcQ5mqFUXuQfgp+Eeg2kXKlrBYlVp4Aukp8RO2hYcr4iJdXRyVao/7ghO9jVk6
         UZdEOhEkS19YKQZStLRUfwzJAz3QwK2afefvViOZyjNF9srT9P904cfEgh2bzHRSroA/
         ekjr+9gbS73vzyOhDqwnnlAnf+4TTX0afvbklTSWIpuLKeMf3Kzv+n5kog5TXxmoDI1w
         cr5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763197265; x=1763802065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q0ZwHP0w/ZzXX9CPFHfzkBVRDrGDiIy2mewdqadHPqo=;
        b=k2mh+VHmFUNgbgZD6GBGzrkhguVKJcwJijqs/6w/xRI/QJ9OzhtCRKVofRG6huWKwR
         c+AEW1dYglsQLhCIj6D5JW4yd+Kjnm1cl0H0aIQmFNCfLBniiIY1qRfXuuT1Vpr/K2dM
         V0nQevxkUo4g05of1xleEDGbQHNT5z/ebroJnLWMewXRYGysQkBJSx1p9PBa5z+9WtHg
         SL3+q3iIFmxIaRq3kJCNs7DABzR0kd2rvlCCm7XyeI7PuM0t+y7F3mYawfSisKUIm6Mp
         BjSs5tSSKq5xEYBzImU2pH1ENrCMllxEQW9cWOV0knxELELKgmLTa8/ewXR87SDNd3BY
         bjRA==
X-Forwarded-Encrypted: i=1; AJvYcCWy/lIcWht5zHjgZ+n7aSVr6OQ/13vaKUSSeO7Q5QeIsWcEvVdNVhzvy90wXLzyqXq8Z0g=@kernel.org
X-Gm-Message-State: AOJu0YwHMrQIpqgTzP+Ns7h3o+TFIQaSsF4QvwqWDexOA+iGsm8Q6hB9
	BXNCGt0gqafzqMGSJ4o9YCKWG0IjVwofETzUBvlFwbPkNxA6kapPv59l
X-Gm-Gg: ASbGncsaPn0TFwHgUE7dRD10/gQ5+7PoG5qIP/kf3SM5wnWYaUDIp1JgZ5dtcYjhpbi
	yTUiln+AWyWEye0X/gHKPyVM8SonW4fpxu30AKopPXpRv0GAHr4KDKiAI3N0UYSpEHpFQQQyPwp
	mcjOzS8JJqWgemYyGqR7pe859rsMs3PDVKBSi4TlmC5UQkNQtBZExNH3N+jhGMegxtiHgw524aL
	UhTRPQrytfk9B0DogVqjlIpZPJ8ke6+ryiDzKKWM11uYS5xctIdFCGBkOUvaTcsdu65LpLRVePV
	CRj6jau9U12DYPb1Xd1CeHnjOUK7Cuu8q6I2LxNYpQ2URDENtTVLNGsnpdSz5FGKXccJpzNlwnF
	Oxm/NT1MqB7iapf0eQETgUd5Zvll4qd5/uRaPqj7t8ueE84mQRqlkrZvmUMQDtrODonJewy3cr9
	PGlSliZqa/HNHzX1SSv+85k7OE+GClA543/I2vtQrBCLXGWCuEObaLuWECROZySceh16mv
X-Google-Smtp-Source: AGHT+IHaz8rnAcDH+Ih4GXwMyi1IntfGLPFhdJ3V0CaIhnOCXB9/ZniCGlMvXD6/h8Eah1krdyuflQ==
X-Received: by 2002:a05:6000:310b:b0:3eb:9447:b97a with SMTP id ffacd0b85a97d-42b595b8004mr5910070f8f.54.1763197264994;
        Sat, 15 Nov 2025 01:01:04 -0800 (PST)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7b12asm15080566f8f.10.2025.11.15.01.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 01:01:03 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 8/8] arm64: tegra: Default configuration changes for v6.19-rc1
Date: Sat, 15 Nov 2025 10:00:43 +0100
Message-ID: <20251115090044.3140331-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115090044.3140331-1-thierry.reding@gmail.com>
References: <20251115090044.3140331-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.19-arm64-defconfig

for you to fetch changes up to 145cde94a5435920cb9f78aacfe91bea6795efaf:

  arm64: defconfig: Enable NVIDIA VRS PSEQ RTC (2025-11-14 16:29:44 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Default configuration changes for v6.19-rc1

Enable the new driver for the VRS PSEQ RTC found on Tegra234 and later.

----------------------------------------------------------------
Shubhi Garg (1):
      arm64: defconfig: Enable NVIDIA VRS PSEQ RTC

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)
