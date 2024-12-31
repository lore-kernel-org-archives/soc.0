Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561D719A28D
	for <soc@lists.linux.dev>; Tue, 31 Dec 2024 13:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735652142; cv=none; b=DCe16NGMdzpPbc4vtjKbEiGBXvdBgsaLr62yNmgblhyPasBN4cRpHL7NmwJ/6IWPViYYmEepVOcfvRRlHB9zX+2GFnRyfrvcvUBktmP7C5NUPaRl0U1V5A1W26yu6ZAn1psQvhneqXcPZlduJp7ZwoK9TVSTTnEeiHMkghdYD0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735652142; c=relaxed/simple;
	bh=2+CYYvfLK7R6AIjTR4eLL1ZBjSmPmi7i0L9rDzbKoy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I1UmuYIX/yBY2dUSUm1QUmXkBsQB9DD4WpJGeODf2M5zKA+ovn8Vq2MN4LIOw3ufzVSCfLdRZBVtaX6MStlV0PTHlSf2poKLgH3vwZCZkc8/NMFUEiao8l4uyT5UugS2Y4abq9rC9DtdnF0RUD1shzn2zhp9OI82cB9LM1GUPYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mt666+Cn; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mt666+Cn"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4361e82e3c3so16023635e9.0
        for <soc@lists.linux.dev>; Tue, 31 Dec 2024 05:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735652139; x=1736256939; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CV5vb8XwLBFx0Gik6pvcaZ+DxzyjzlxONLG5o4wTrAg=;
        b=Mt666+Cn5cqrFZmXAi2Ie8HmfYvAJ+oNA3Z+MCYsn3rOUGc4vw2y429hWn1aX+6qKp
         Kcz8HR+kCDmaBXb3nCAcRpGrgUILHA67GhLUqo66UjJzSYXZe6USJLHp6lt3Zx3ugkX6
         LPxGKf1IP2/KmuVUFTyVDddJNqWxhD/k21k3jrq77/oMs8Rtg88peFMw28wNlFifA8eO
         r2Q4NA5H9NKec4sVT5edGbgRh9Tp3tP0HSivjEB40cGljERDIvaVmaRKLe8Ygr0qHsj/
         mWDEJu7/m7oHsd8qctCBuMo+GKLMSLa5AkMYWLyziykA4gnCNiaRKvTsi8YEzF2RRbx6
         Nhkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735652139; x=1736256939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CV5vb8XwLBFx0Gik6pvcaZ+DxzyjzlxONLG5o4wTrAg=;
        b=kGrsa2cqE9lKDWU9uAvj4bkVLJDO1EYV83Rpbv7IAnr2A4vvBC0HZoRxchn/RvVz2b
         X+tkaszaw2q1Xp53mCaLTL2k7ksmfWn6kSNBvk6er/bvMsOPfXKN4KUNKvtISkgzQOpR
         6Cc9WTToXWYOV/foFRbxCrPc9v4MCtQFciW2tXkShjj9VBZlaBJd8kta0AGOzkEZv1Jk
         5B0mHQedPmswqtY6zFVIroXfGA/vWZNdftJlH1RVn1I6GJzmyb+fir/C0JCD8BjrC4Xo
         /zrZm+uNRfM8zyBwEOPEiC/HMM+ELAIPERY2DBxO4ZfJgB84+pHRwOS2h1OsAxQGSB5P
         yGkA==
X-Forwarded-Encrypted: i=1; AJvYcCV3AEzkmW1BQAmcu3KFojaynixRC3lgH17syOIyShFPQTyZskhhM++WGmmOPlYw7gw1oqs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxRFXjmfqEGgTOwJRVyiXmmiltGIFt+6Rc1QcziiNplEh4A4OSb
	Js2xojnlISMOiINXPmGLlruLs3TJZCynDh9aG5eS4OOuizK9T8NKaYNoG6syfwE=
X-Gm-Gg: ASbGncswnBufG9B8P3TC1q02ZeGXpAhwJ2oX9RgrUq3AjR9YFQ9crQhv+OLcLde9262
	3hrx9DUcSdZBXgx4yGiKrGhEB72DWgKTVZ0wg+aIZM3zcQgPBJ3VB4ToTpWBxstyyPQJGn7qRui
	mkVaRHGsEDFdLdNr+GVJdj25aTbeHCj2N3nIF09Zyw2NR4EspxB0QwQNZjSKx4JD5jUnjhgWkoW
	ZZjnjZJw7sdoi0LQuqEEik6OrTRJAlm7HfWdUFy23obTQ3iO6sZaSOT5ZQ89gRj/m2tw+4=
X-Google-Smtp-Source: AGHT+IG/MIfYsZo9g+nwazjYYt89brlmuBdr3KNU4FavCXvWpSVwBnnpa7eG9ucGjJk9IflNXMswAQ==
X-Received: by 2002:adf:b601:0:b0:385:f7b2:aad8 with SMTP id ffacd0b85a97d-38a221e1e09mr10075639f8f.1.1735652138650;
        Tue, 31 Dec 2024 05:35:38 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8ace0esm32318346f8f.106.2024.12.31.05.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 05:35:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/2] memory: ti: for v6.14
Date: Tue, 31 Dec 2024 14:35:33 +0100
Message-ID: <20241231133534.136771-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241231133534.136771-1-krzysztof.kozlowski@linaro.org>
References: <20241231133534.136771-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Topic branch for TI memory controllers. Shared with MTD tree, so I kept here
separately as well.

Best regards,
Krzysztof


The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-ti-6.14

for you to fetch changes up to df8e78607d4795806b59564ba7a3e2e125d119fc:

  memory: ti-aemif: Export aemif_*_cs_timings() (2024-12-09 20:38:27 +0100)

----------------------------------------------------------------
Memory controller drivers for v6.14 - TI

TI AEMIF driver enhancements: some refactoring around timing
parameters and finally adding plus exporting interfaces for devices
using the AEMIF interface (e.g. TI Davinci NAND controller) to better
configure the memory interface.

The exported functions are going to be used by:
drivers/mtd/nand/raw/davinci_nand.c

----------------------------------------------------------------
Bastien Curutchet (6):
      memory: ti-aemif: Store timings parameter in number of cycles - 1
      memory: ti-aemif: Remove unnecessary local variables
      memory: ti-aemif: Wrap CS timings into a struct
      memory: ti-aemif: Create aemif_check_cs_timings()
      memory: ti-aemif: Create aemif_set_cs_timings()
      memory: ti-aemif: Export aemif_*_cs_timings()

 drivers/memory/ti-aemif.c       | 192 ++++++++++++++++++++++++----------------
 include/linux/memory/ti-aemif.h |  32 +++++++
 2 files changed, 148 insertions(+), 76 deletions(-)
 create mode 100644 include/linux/memory/ti-aemif.h
