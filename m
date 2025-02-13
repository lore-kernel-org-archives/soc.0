Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1584E245013
	for <soc@lists.linux.dev>; Thu, 13 Feb 2025 18:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739470944; cv=none; b=B3EzfPZYGwwzumyTlIb6B6Bw5PKXjVIHf5Cu8zFKLupAOGC9A8YjKySYCDDfQoqI+SmqcHkmtBArHdLCEniqy7foOn5DV1dXAtUZox7gzJd6+j/pxQYeanH926mb6KMcOCkXTfL4rTFSCBjJafFkr6c0gqJBksWFG2MOzi6Ys3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739470944; c=relaxed/simple;
	bh=mqlGSkOLFVjlTv7d7OifIPSBROEoCMVKdqBIfDAIbLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JAK6dsVDorotaJAgQA7u2Isw6ScgFGJTU6mjSfvHQEcCL6fyKut+wjGNjt+u8UX0vuJvSvHxm6X+Hr0Vn2zIoV1Kyp2T6NBrulT0rMUoo61j0pIYep7O3mU2NbqbRU+JV5VmnBvS6Sm6OpWh6S2rtAWa+gwtzFxnITOUHIpEBL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mOntG+AA; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mOntG+AA"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5de5a853090so2655000a12.3
        for <soc@lists.linux.dev>; Thu, 13 Feb 2025 10:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739470941; x=1740075741; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXickYQ5xAEYt94NMMMnFRp+aeEMQkVX/WoesWHUNR0=;
        b=mOntG+AAeSsdJCROTeV/fJsSlfaYs9hc5QIlrI7q1racFvV33leZ6BChdq/PDlVm8/
         FXps5YwyPP2hiYOSMd2Xy1U57SGhzrMjNNRHvlqkfD9zvvZaUcSQWlBHBifaydGZvXfJ
         z6NFpiDq4R7XurQ8PKRxrcf1vuY5bw8U5qSxEKoRr7bWoMedltKpu1N3wuudci/R7pgI
         smVR2mnSEB4M7zq4tcri5X9IctrAW3dDR1pesgA5TaZUwNh56BVUqj3F6Ov4OOdWsG0/
         pREv8pUOwXkrva/nJGXMSB3bfJ/LtvAcN1jrLz2qWgaSXx24smw2yQKz44j+fe/CSVa7
         UHsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739470941; x=1740075741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JXickYQ5xAEYt94NMMMnFRp+aeEMQkVX/WoesWHUNR0=;
        b=mUOX7sYHS+z3dtDWokF2wVaoQQFofNNTxnNCp2sHh5ppsz6FZjg442KyYP5SelEa+4
         XEF++goPkmuG0qq5lhH3jcBrUfzK/qCdqKdXwg+3u1Hc16kVmrXZ9AviIvCR26407lBe
         PEA8ZEmPWtf0D0xsLhztnQEniH29xjXIMcVz+p/mbjyy4T5WiJb2NO27HRN9AIBzJDtb
         437tbmpMjMsq7Hc/gOvyN7CcaWYqn/11p9buwbCRvzwlk9zdY8of1bmb9IGydO2YBdNf
         v/j9HS149ZjZoEUsdwxBiCsA+XNoeWzIY7D2ASyj8dbGQSvIk0sCfW/FyYEFa9y9PyGR
         BOoQ==
X-Gm-Message-State: AOJu0YyZPZeifBQUWoGe5qz7TU61Qp2UOP9pJtUDHWHGwG0KBL6r9T1E
	G/ETvgk8CWs1B3cnA6cGZ8vmokZp6edPvubOfkFn7YG2HPlCY0eqrU7OPk+Y
X-Gm-Gg: ASbGnctEa3+WjTVLfXlwgvzM7xfZ5387IjUKMcWHwwg8Zb+7bRrxSBx+wizsx76tGf4
	/jMXOLeqM0RG2m836wUSiE5wlc3mg0CAO9a6tkK7BqD0s38omzQT2CtESqDZT9iy0uvMQnsvhoi
	BTd6ImYQlLQmhTvuLMJq1C5KJu4rvnzcmSehuWnIlX2GM4TGXIlLWxDCUrFuZddKOP6WejVw4i2
	lBcX1rRsUDMpWOZLkhbXmsUc7rPJDGJurBruIU4JlIfHy63mDfO0MiZ+RjemYCGo+faRd6ckGcP
	WiH1syNVQ2QjHbSqhEw3YkDMYgZj
X-Google-Smtp-Source: AGHT+IFaVkiJMnj3VgvIn4KY0EMAfKgQjPIsRKUFGlioLk6ajpy6xkcQn1ZmvcOwltCu8C2Fpa2fIw==
X-Received: by 2002:a05:6402:1f11:b0:5d9:f21a:aa26 with SMTP id 4fb4d7f45d1cf-5deadde79ecmr8166783a12.24.1739470941293;
        Thu, 13 Feb 2025 10:22:21 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece270a66sm1559230a12.52.2025.02.13.10.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 10:22:21 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-riscv@lists.infradead.org,
	Haylen Chu <heylenay@outlook.com>,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v4 7/7] arm64: defconfig: Enable rudimentary Sophgo SG2000 support
Date: Thu, 13 Feb 2025 19:22:08 +0100
Message-ID: <20250213182210.2098718-8-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213182210.2098718-1-alexander.sverdlin@gmail.com>
References: <20250213182210.2098718-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable ARCH_SOPHGO, pinctrl (built-in, required to boot), ADC as module.
This defconfig is able to boot from SD card on Milk-V Duo Module 01
evalboard.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v4:
v3:
v2:
- moved CLK_SOPHGO_CV1800 from Kconfig.platforms here;

 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 1f25423de383..5680b8fb6b12 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -66,6 +66,7 @@ CONFIG_ARCH_RENESAS=y
 CONFIG_ARCH_ROCKCHIP=y
 CONFIG_ARCH_SEATTLE=y
 CONFIG_ARCH_INTEL_SOCFPGA=y
+CONFIG_ARCH_SOPHGO=y
 CONFIG_ARCH_STM32=y
 CONFIG_ARCH_SYNQUACER=y
 CONFIG_ARCH_TEGRA=y
@@ -650,6 +651,7 @@ CONFIG_PINCTRL_SM8450_LPASS_LPI=m
 CONFIG_PINCTRL_SC8280XP_LPASS_LPI=m
 CONFIG_PINCTRL_SM8550_LPASS_LPI=m
 CONFIG_PINCTRL_SM8650_LPASS_LPI=m
+CONFIG_PINCTRL_SOPHGO_SG2000=y
 CONFIG_GPIO_ALTERA=m
 CONFIG_GPIO_DAVINCI=y
 CONFIG_GPIO_DWAPB=y
@@ -1398,6 +1400,7 @@ CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m
+CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_TEGRA186_TIMER=y
@@ -1517,6 +1520,7 @@ CONFIG_QCOM_SPMI_VADC=m
 CONFIG_QCOM_SPMI_ADC5=m
 CONFIG_ROCKCHIP_SARADC=m
 CONFIG_RZG2L_ADC=m
+CONFIG_SOPHGO_CV1800B_ADC=m
 CONFIG_TI_ADS1015=m
 CONFIG_TI_AM335X_ADC=m
 CONFIG_IIO_CROS_EC_SENSORS_CORE=m
-- 
2.48.1

