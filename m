Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5694E21A4BA
	for <soc@lists.linux.dev>; Fri, 25 Oct 2024 15:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729868760; cv=none; b=AlkEKzTXDfR8lA4+YF1uVhFQMTt+FCBcTyUDE+uKIpGKv0AUn+m5y825UhHssArPMnVYxp97ECalxBnOEUy0hdl7YG75xvtbMSyfjdJ9W3XlYUI9dtAMt/BOnlDqFNDiAvF2zYel2pdQwF+2q40XsNoKk218KZWa6BPww+txsi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729868760; c=relaxed/simple;
	bh=mL3P31vnK94XPTMm14lw9mYHxzoIT+LrGWCL/+RNDy0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=k4Zn95Klx3wQuIusZpvxO8VrRyjWoqvgPiACKkE5l1srCz3ZfKsLLNeM9bjoeqq3mNcKvRaynjd+ptWp1qijFLMr4ZiUhYu+Zx+W53DydTf/VshhDKqlDToNyPabNEKJQs3UsfpyRt24nWdelCxTnyZn/vtPn1fid2l76qqsfV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hdft7cHh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hdft7cHh"
Received: by smtp.kernel.org (Postfix)
	id DAC45C4CECD; Fri, 25 Oct 2024 15:05:59 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EB1B4C4CEC3;
	Fri, 25 Oct 2024 15:05:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EB1B4C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53a007743e7so2665614e87.1;
        Fri, 25 Oct 2024 08:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729868757; x=1730473557; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o4jm7E2HySnELyG9zm7DDwvDwm6AuAvYPS0Zt6hbJzQ=;
        b=Hdft7cHhBeuQy2wb6rrO03y06R2uHZKQbawzh3RQkEwDtUyJtHHnDksFDCPoKEvKo6
         v07ovoFvsHpKmeFWHbIPj17HEDf+gDhZAc9abnitP7ZH2qH6WLHdyhcMF5I3gXscjsf3
         +eZ0D4ZDElOOjb+5jkothOEj3J8r8hjrYN/jCD32DT7K61dBwTDMPzgX2Fz8wwUJw1vt
         cKHui1xrEXERmyl8sCSt/d+8Cit7y/zMalX5U1cekvSbN0grB49HXuqRNcUREHgf/KPB
         nUV05Cnvwmt74ppV9vPzL5eprPsOATzwqw4mXPljfhUapN/6Jt4w4eMymkvCKjfqhl5F
         U9Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729868757; x=1730473557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o4jm7E2HySnELyG9zm7DDwvDwm6AuAvYPS0Zt6hbJzQ=;
        b=kJn16EREu6N2DuG3QJ3EV1IS3grfr1QCb7A9lIKA+i5DbiOpW/D4TwY1o10Sk+gjXW
         v9T5Imz4yhUIh5xUTIo136GxjakdUdKkBGzLIIJJKd+QBtH6SBwtmHkaxDx1IyrvtuCA
         GS+XbADap5tLnIqbW8TVxt9iVO2JKqj7GG/CflnWwYbo8Hb5sxRLQJR2VBFnwJOUmx3n
         Q7xDjU8pulyshiRpRWv/hKOGPeUbZyPgkYrku/y0nNhBrQd6LYRhcZ0JjHqshjttSYnD
         inJ1yTCJNlXG/zzEwrUMY4OxIjTyZr+5XDca7HPmywoAG/dVz1A7z6m2pw9AUOfqpVLk
         F3Tg==
X-Forwarded-Encrypted: i=1; AJvYcCXO9dHI9SC9VL+uayTKLcMYAgfYTS0oKencFOlYcRR78WEsc8IQo9fYTpZwbrXwmAi4ssc=@kernel.org
X-Gm-Message-State: AOJu0YxFk37UWEol9ICr5GhEC0vzy0dzqYy1D48YK4ZyaA1cz1nvgzhr
	NpY/vDqn/O3vO7iF+XSU5l6MzndOgTX5rlt3gNdsB5LHk2vz+zgNU5Z1/sjI
X-Google-Smtp-Source: AGHT+IHTM23FL3bJlpdISIMVzlbuGYE9A6hd7jLPKz9nwIWo6tnhlsoUHKmmW3kzgkp6OuVhvzyoHQ==
X-Received: by 2002:a05:6512:1594:b0:533:4689:973c with SMTP id 2adb3069b0e04-53b1a33312amr5892835e87.23.1729868756328;
        Fri, 25 Oct 2024 08:05:56 -0700 (PDT)
Received: from localhost (p200300e41f26ec00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f26:ec00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4317dde77a5sm73187855e9.1.2024.10.25.08.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 08:05:55 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/3] firmware: tegra: Changes for v6.13-rc1
Date: Fri, 25 Oct 2024 17:05:51 +0200
Message-ID: <20241025150555.2558582-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.47.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.13-firmware

for you to fetch changes up to 61c6fe3d6f0e1606a2219ff8afbac7e5068a5795:

  Revert "firmware: tegra: bpmp: Use scoped device node handling to simplify error paths" (2024-10-24 18:38:07 +0200)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v6.13-rc1

This contains a revert for a patch that I had modified before applying
and the author didn't agree with the change.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      Revert "firmware: tegra: bpmp: Use scoped device node handling to simplify error paths"

 drivers/firmware/tegra/bpmp.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)
