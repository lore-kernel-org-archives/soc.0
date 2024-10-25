Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3748721A4BA
	for <soc@lists.linux.dev>; Fri, 25 Oct 2024 15:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729868761; cv=none; b=NowiaTCeW4ncT8DP1n+JYMNjO8vKI1H8jNXbCn9teINPOMKv0h/v9kefCXJ6MdsBn7tO6W1UoalV3qcPs1kPOK0eWn7ai5C8fLeqzPvYiTov1gLgoiiTkx63H2PTwnSm3mXGKPVsl4QVYLx4/meqoudFNLRYCwZztbpyybs5ylU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729868761; c=relaxed/simple;
	bh=4yUalD770YGcCi3aC/tYZ/6aDhy4qrpg2LX3Mvo4ljU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MlRc1YAx2CEp5EmMTqtyhWx5pKHQbI13p5Euv3g/gSfl+hYRFKXt796wfwGjYYnsqOEM9PjB4Si0awXzE8xoyuBz0yk3mkRLRll7Ijyt1bvEkFKuXiEAcvXeZ1yT73iqNGQqGIiTfv/bB1OiBTwq1V2TQYscB3+gbg/JEOR6r3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jYdMA2gx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jYdMA2gx"
Received: by smtp.kernel.org (Postfix)
	id C2339C4CEE4; Fri, 25 Oct 2024 15:06:00 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DBE2AC4AF09;
	Fri, 25 Oct 2024 15:05:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DBE2AC4AF09
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb50e84ec7so18504011fa.1;
        Fri, 25 Oct 2024 08:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729868758; x=1730473558; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3N7tIFZ/AxOAsyxDDEDsOJgBWk6XC0sx5+hvyvRCSE=;
        b=jYdMA2gxUviz39FKujw074HbRJ3iCiB2q43snG9jGMOQw+2ujiWMgE7CTfJ0Nu+mY6
         rmf2VnBVV6gRkJ2CZhZFB3Z/nPh9hrhv0wtGvaE9FjhlfTEF1iTBI87ZqEo6h1TVoXkP
         ZxeJkzfVSctm41eoYzxbcMMSmA7aX0ewgH2wQ5yZABbIs7l6jF6Vq8ycaCEBfLZ2ZbCH
         V5pPLNaBNC946es9Nd04rvN4OkdvdK4O0ox9gmALjVArGItBCJMJl+DfP7S3B1GhjGrr
         fN2ETiXHP7fTGPHW9rVWBbUDd3qwZEGYp2hiGQimqSbWfNGyjl9azSmiHRMgmHcfw9lo
         o3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729868758; x=1730473558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i3N7tIFZ/AxOAsyxDDEDsOJgBWk6XC0sx5+hvyvRCSE=;
        b=ZBGLl+XEJmpbydVa/2tu7maa7cs+hlpOrIfUl0iCAH551cuCzCkZk/feN6oPEX9wP5
         A2JAlECuOo3YcsyFpXLxvT/c0384o25eiOPeuVE3znHlbvRrBW59pHrOQqf6MhOOioQG
         SUcS4K3qq2FpGUzaykUXYm4cjyV0/oufsJFHr1Ko8aCAQ5d8cBoiQ7h0kc3+DDHGTY0N
         uAJhhhMqyISeW77Yph5uHvtbfnJVLZ0zDRgeDH4OY/FyqvKo6xUcrM+VTHljYdscuVAd
         9gJz8cJvIFGsfWjjOv1jlI4wlPWHOI507FbYOqyExpG3V9t2Fa8HO21OvAf2GWESknGF
         Y9JQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuJu2/wVVJ2UH811OhLV6Qtd7A8aZJw2ETsjbe+gb2liWxmR2nbGnEXbp5baWP4cVaUWQ=@kernel.org
X-Gm-Message-State: AOJu0Yxsxzaygbh8vboKLZfSSguwxOl/dkRTZ5MNUokAVCmBw1kXRjJx
	azVPEYN39BbQkq+9TmNp7kQzAoGkopW9aBeHk7NbUgJdS1PClPcIUAZg5kCO
X-Google-Smtp-Source: AGHT+IFrsZWEoyBnhS3RPaZ5Zmw4dvGHO73/aCwUsgK5sZG6dgINNxsk3Az1YMPxmoJf6izmtskC8g==
X-Received: by 2002:a2e:a9a4:0:b0:2fb:2b5d:215d with SMTP id 38308e7fff4ca-2fca81c1cc1mr40595521fa.7.1729868757321;
        Fri, 25 Oct 2024 08:05:57 -0700 (PDT)
Received: from localhost (p200300e41f26ec00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f26:ec00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b57b472sm52204835e9.43.2024.10.25.08.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 08:05:56 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/3] dt-bindings: Changes for v6.13-rc1
Date: Fri, 25 Oct 2024 17:05:52 +0200
Message-ID: <20241025150555.2558582-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241025150555.2558582-1-thierry.reding@gmail.com>
References: <20241025150555.2558582-1-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.13-dt-bindings

for you to fetch changes up to 1f451e2493a66345aefd13490d058e46dc25b459:

  dt-bindings: arm: Tegra234 Industrial Module (2024-10-21 14:53:37 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v6.13-rc1

This adds documentation for the AGX Orin industrial module.

----------------------------------------------------------------
Dara Stotland (1):
      dt-bindings: arm: Tegra234 Industrial Module

 Documentation/devicetree/bindings/arm/tegra.yaml | 5 +++++
 1 file changed, 5 insertions(+)
