Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B5921FF4B
	for <soc@lists.linux.dev>; Fri, 11 Jul 2025 22:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752271799; cv=none; b=mUVB4dgUjGiIBdLgicMhgQAYmHaUwLWKuv8khrLSCw4zGvIygNSVly0z7MFLYJK9AKMT6h2mj8uXrOzSi0H+W3M5LVAuG0uGikqSwlxS3ppSbqEk9F90Vh+EPrCo/hmtCN7wOFAQZnDxC4Fs21TIJt6Ydx83zz7Bb/LGZvUFqig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752271799; c=relaxed/simple;
	bh=sBUY8HVbOqjRcVUZTWuZzJD7O75c+3tJ5HBIki1OZ2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A3L91tdIHEehSeXiuL8OZYOZZPrm/zdTlxyXXSXxYmzD8bVHPmEHJs8gBb6j1AOkInPTtJW7WOa59qvvnmgyX2JfeHknu5uEMkVKuxyHRiWCYeNmgXJB1uwiBlMzES52XZ9WovGv6iV5clY6yP4Hrqd9mKEcark8q5EmOZS9GDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nW4zXM2e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nW4zXM2e"
Received: by smtp.kernel.org (Postfix)
	id DCB2EC4CEF0; Fri, 11 Jul 2025 22:09:58 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1E092C4CEED;
	Fri, 11 Jul 2025 22:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1E092C4CEED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso1587439f8f.2;
        Fri, 11 Jul 2025 15:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752271796; x=1752876596; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KRwSwkMCStCK2FyHeopJuqi2qCPQVzMg7D8DapyeF+s=;
        b=nW4zXM2eNQpbwaZqrDgnuZpu18KJlhBwG7gvJCwonfZAKKpQ6vhKMR+bUU5SYGejVJ
         DwuCL2/U9fICIiQuqJVQi+w5Q8s4Ps3j5k5Kq0rqL2s7h+s9E9a7XOY3Rs3ikTU4u9Vg
         pnIMH1Aiq5VYJfYWRAKNNmhQP8XFVnlvhe5ILZrDVvOXO46P/lGqXJsnx29zRzH9H8eE
         6ohFL1JyFoSXnDNAWmow1iOuIojBJP1ROThVLDrLy1JA0h+0ZkepC7qNyJ+mYB+fQLT/
         cG3TEpqwxx0xMwHDrIXxdE9zp23j7P6/4iu0zjJsiWlJMADRFDVvSuyi4qR2OzcqdxFz
         QK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752271796; x=1752876596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KRwSwkMCStCK2FyHeopJuqi2qCPQVzMg7D8DapyeF+s=;
        b=cBSdpnUEW90cjVez2KVkWRmpUPkQ90mbtsJ1aClkxqcq8sPS4LwMQ45OE4cylSsgc5
         sRNKCJaqWTERA3qCbWoEJs22P5Ftz1nITXVjr+rUA0MZnbGFG+TYJJHeszRzsThtF9no
         CzebczYZQTR0tPz6Mo3NNd5mMFvmxxwmzBNCZp6FBvf8zXjoq/L3vbsMxPsU4eMqO5Gb
         wuYGMMhWcjQI+1DBRgr7uwSF8dbKfTQv43u2e29Ej/Su/DtEYsk899sRGBOvZqeD9J9c
         sq0gfKvwOwEf3LDlprAUUY/BsAxOfuqzMWHYFtCT9H2shzk//Qs65eWNZrzDnTcjXAIJ
         cHcQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/teJ1zDl2+XaCs0I2N9xpWoYLr0/cHjGOnecg9wmWqBkvL3UC9pO/WqCndRndfxYQAEQ=@kernel.org
X-Gm-Message-State: AOJu0YwEts/IEVSB3GCr6yXO83H/Uu+aYviTKaVa2VMSbgviAE8NtN22
	KxvM7H8eKlkyJI/PE8ABzj5WagiLN/nqu3hpw+Ri+MEUg4Z3vu+uc2K8O5Fy+Q==
X-Gm-Gg: ASbGncsYTaXzBzgZIt5+DWfvKtwG+rAN6yS3nUaFif+1UkukXHrbjaeDqiXUIsi9+Z9
	JmWfN5KZ5gcXWDR7URsEE+MIVNzhlbaHt07xYSWmu5jsua2FvZ+TkaPYZo59sjZTHtiV6Yrg7Ox
	3ovJcgUnLlLdMPfD6jPXuKp1o/0A+1B/KuF2ZoiuIQoDhCieqhOjZmLej01mMgs2kFU+zp+1bOH
	fYh1cyfwDCbsEAU7kvnvpmn2krMMjHvhT5OxJXramOPAojyy3atxnYYkHzw6APH4JvgGTkfmnh6
	26bv8EtEk+Iy7llQHSNG6s3vPYjE3yPNoPeoYktIFuBwKHD02bBOtotsVv3YzaI1DzQVMLkcn4g
	QwxO8DFty+tIiCzFbjBDo7gRQrl7VRGXfolCHuqAbitHh/8DbXv5iMHb/XOvBA/LnAQLPzlvWFy
	49KYEQI8duzr8K/g==
X-Google-Smtp-Source: AGHT+IENH1hy3RB3Y6IqQfb9Wk7lIQp/dnXlD6dHrZhbvQVNIhOUcU051VDc+cLy6tZHWGLWzJ29fA==
X-Received: by 2002:a05:6000:643:b0:3a5:25e0:1851 with SMTP id ffacd0b85a97d-3b5f1875e37mr4907758f8f.7.1752271795585;
        Fri, 11 Jul 2025 15:09:55 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8e0d76fsm5704960f8f.64.2025.07.11.15.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 15:09:54 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/8] ARM: tegra: Core changes for v6.17-rc1
Date: Sat, 12 Jul 2025 00:09:38 +0200
Message-ID: <20250711220943.2389322-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711220943.2389322-1-thierry.reding@gmail.com>
References: <20250711220943.2389322-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.17-arm-core

for you to fetch changes up to 398e67e0f5ae04b29bcc9cbf342e339fe9d3f6f1:

  ARM: tegra: Use I/O memcpy to write to IRAM (2025-07-09 14:20:31 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Core changes for v6.17-rc1

Fixes an issue when copying data to IRAM using memcpy() and use the
memcpy_toio() function instead.

----------------------------------------------------------------
Aaron Kling (1):
      ARM: tegra: Use I/O memcpy to write to IRAM

 arch/arm/mach-tegra/reset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
