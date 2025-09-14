Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863F425A334
	for <soc@lists.linux.dev>; Sun, 14 Sep 2025 06:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757831981; cv=none; b=U9QD8p+o/8a9CpweEmaBSzN69UZdQziMGLcr3EccP+cRCca/2mXVxxRht35+bBiMDwKAfAeVN9RAhH07OC5zfBPbkBFiaKTKDX9TqDenXv/osXjlvDPDUFnAj55/CC45AAOoio1kCOwN9uHGYYEeYcrp8AQjDNjVR9iM/uTiUVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757831981; c=relaxed/simple;
	bh=bsOd8EVRaDr6WTbWAnHzgvTOV9nC656Hbrq4fioi2hs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TheMdY3rp65TJ3cfPZFauDc4kRaosXsD6cCSrAH470KhjteVt/cnvqnMk/zFcxqL3l0MuD053VswU0yXekUcn0Cam0wi0H6CaYIDNupOxAP76tPUB2KMvbqKz0puwtrX91HFuc2At1eZZHBXP5FUQw0nHDk8TuSI4zSMpvHCTDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HiREYR9/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HiREYR9/"
Received: by smtp.kernel.org (Postfix)
	id 2D1A4C4CEFB; Sun, 14 Sep 2025 06:39:40 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 48B47C4CEF0
	for <soc@kernel.org>; Sun, 14 Sep 2025 06:39:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 48B47C4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3e7622483beso1567096f8f.3
        for <soc@kernel.org>; Sat, 13 Sep 2025 23:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757831977; x=1758436777; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UcBio7jHPm6Tt90nNr36duLDMqdkUZVCgN2oNQY+Gdc=;
        b=HiREYR9/H4Qdf9yDi8zix+2gbQpyvGQWr/fD+g3xHIF63UiasFVwpNxlBKBzQ8slzA
         JUi5GTuoIpgaR2QbJrr+dCwtpTC6r9awVRyUMlgJNt+yjov11U4Hwi01LIyDxt8UlVxv
         fhMiDvAC3irxsXJrBFyQNxDJDI+JvG1Dt/EYZyR70jzvHqZk2Ro3CE1eQNYtJfMcqquB
         UkwdQ/ka1owlapLIcL+ajWhmNeNbOVBmZorhYpejM4oVwoN3cIKpgN/bA9bagzn7HgKI
         XWGyPeScGTqlLZB9qM4TGySVFLLm3GqQni2h5J8uLM1Mu/bo/46cZOCfl97NWaSEThsp
         URtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757831977; x=1758436777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UcBio7jHPm6Tt90nNr36duLDMqdkUZVCgN2oNQY+Gdc=;
        b=Fn/z7b6SnC0SeWO7AgKzokr39c39DXzxqlZD/lI7tzGLPUacwLTixD02TpZbvqkmyI
         wsZqxfzVjy4HB3LsnWFkyaU9ZU8RSvd8JCIHmtF8u/ZsXQUeUbaP0i9zpE7vFOHFZw3P
         KlZSE85q0ou5IbcY0kGwO0N/9BnFCdeUOBJ5N1VDwJ2j4c1K24iChb7KuIN+cMBafNfr
         2A5y6GERBYEu4iIA+urOebb00Wz+j63QPf93IfyCPBtChP5t7I/yoSXD+Wy05aJ7NwlV
         QqKmZpWy71QCPjIYOdNcgUppyVhcFzDQJ1uAayvHyjYCwzucSCy4oSOJnKDts+HHMmLj
         wWmg==
X-Forwarded-Encrypted: i=1; AJvYcCVQPtXAJq6I4aHtae+jSLYw6sbPRdWoRiaPqNDlKMNH2z+04mAQq0Jt1aj77UjyLQimSVc=@kernel.org
X-Gm-Message-State: AOJu0YxNf3WfZ5LA3zLqEffXeXa2RC/eX6IeRrONRUfmW1bMEkcJjDP+
	g7fUdZSA9Yj4SOK/i9yjPMcBgwWabnXTeFIjPn50QkRdVvokDt/+T6UQ
X-Gm-Gg: ASbGncsthMHcrKB917Qho7TRW30SEO8RpGxveMpGxVZqXoKep15Ists16EDeEifaG/p
	hn00ss17waH1HrBClosm4+6Fa1qPAQoFFlhdEH9bpBHuOv/xOe5B9km5fPE5jX6ncIuOFtdUoO+
	TC9CFC3griJqEOIZRkJujQ8l1qdz0/31u4M3Jdov9N/CxOD3YfldU+yzyHqJSSO4yh5veU7fPsn
	rnW+afY8NZMvul/CMkPli43c/9D6EqDWkc9E5de5ChethKIBDr8nMbsz5Xfy3S/cvuW+8QDtvMy
	9G9dTWJy+N2HK8N4XxxSLrwIH+MNmT0ZS6/mxvRY6X8TrNjGJfF1aJaYb3EHm5dIIXBw5xAdQWM
	WgcPB9y3HXbxZt+6HzaHzeXUQHVyYrp/IBpKcvQXm8XVqeboObvmFaZWB0EcfOuLx6TjyoHc8Uj
	Pqbu35iQRCZGb7FQ==
X-Google-Smtp-Source: AGHT+IHymrOL+tTeViZP10RPGLwsdPflgferYQ5FgiwTqzzZ3HJC28XlDRAnkYKailfHPno4A8dELw==
X-Received: by 2002:a05:6000:40e0:b0:3e9:4fe4:2619 with SMTP id ffacd0b85a97d-3e94fe45cbemr2544297f8f.25.1757831977436;
        Sat, 13 Sep 2025 23:39:37 -0700 (PDT)
Received: from localhost (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e82f647b83sm5778948f8f.20.2025.09.13.23.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 23:39:36 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/4] arm64: tegra: Device tree changes for v6.18-rc1
Date: Sun, 14 Sep 2025 08:39:25 +0200
Message-ID: <20250914063927.89981-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250914063927.89981-1-thierry.reding@gmail.com>
References: <20250914063927.89981-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 04f27a0fda6b6be104531eeb95d07ef1b3a72af8:

  dt-bindings: arm: tegra: Add ASUS TF101G and SL101 (2025-09-11 18:28:57 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.18-arm64-dt

for you to fetch changes up to e1899da95f59240ed2d4a51d7a89c8b77c45ff06:

  arm64: tegra: Add I2C nodes for Tegra264 (2025-09-11 18:35:23 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v6.18-rc1

Add I2C nodes for Tegra264. These are currently unused but are needed
for subsequent audio patches, as well as various monitoring and other
auxiliary chips.

----------------------------------------------------------------
Kartik Rajput (1):
      arm64: tegra: Add I2C nodes for Tegra264

Thierry Reding (1):
      Merge branch 'for-6.18/dt-bindings' into for-6.18/arm64/dt

 arch/arm64/boot/dts/nvidia/tegra264.dtsi | 225 +++++++++++++++++++++++++++++++
 1 file changed, 225 insertions(+)
