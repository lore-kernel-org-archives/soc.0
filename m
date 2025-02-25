Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02401C84C8
	for <soc@lists.linux.dev>; Tue, 25 Feb 2025 18:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740509311; cv=none; b=OJA/waa8fCwfQnD8ucRfugaYUy1NqZuaDd3bV6jjt6yMbwarMUFqH5IXx3QtT6PNjM6B8HoQrdYREghE/8m9gsCKXRozIRCkxFD4CuqVGHazhHblkfPFQnm/wxNdsJJ5hRkG04syR+lkjS5RTGTlcENhJSRlIji6XSG3q0dFSzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740509311; c=relaxed/simple;
	bh=tCCjly+Qh5AY74QbK5LfS4mXEJXwkw/OWlEpJf5244k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d0bNwWkmKTx9E6rvWiKKLRHu1T1sQC3Lrb9wvNpuMvCtTdpqKsU4JlHsNUyO4QoQ/9K5Ztjgz8uzTmYXEgnSTYCSvU2SSJYyYeG3E/Nt9q9eP5Y62/QsnitcMwhG/POz3TIji3r8oHF3rk1auCInAIJ8IHdAIa3119FdRlPbZRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RaO5FYDk; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RaO5FYDk"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ab7d8953b48so95714166b.2
        for <soc@lists.linux.dev>; Tue, 25 Feb 2025 10:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740509308; x=1741114108; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/oN23gi/Cv1G/Zd8ve35VhHoD43rI+bSAAj2I1PX/Ag=;
        b=RaO5FYDkMR4J3tgvZE32zCL8h0y2c0B0no9Zq6XQB0bmMchAUwtveZxyeF20W/yWZo
         WE88PvJHXML730IzlHjgFJYqTDv9+7a3nCMSLKJu4Z240exRxDl7ZVxL0MYlezQbCpUG
         /nnP3K7E4QEubLBjLeA1hmsICXRVQNZ/sYL29ALj4dQ2rrZAaKfRdf8jfpvM8sPg2h5K
         zRVyTp5Pr7fqFlNSLNCGe0O6Bb7HqJeeimt3jykCcvcjBQ9Zl5ynhTGxnuDmEvEKOJ6P
         A7bCb/gduCrUTcsWnA9jgzkicPgSU8OMihI/xYxKipc83wdl9psJQYXocMDz1SAV76vB
         zxCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740509308; x=1741114108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/oN23gi/Cv1G/Zd8ve35VhHoD43rI+bSAAj2I1PX/Ag=;
        b=Ft3XcIx36Nfcc2UKMjC7h8uMqqHnLAkYd7BhrfVM+tFZXrawQC3msxb2ky7pMw+1fP
         KYamkcwgj38Aftp/ZjcFMeqoo0UaHUqRXi4Dk28ZTLuHKj8x2t66hd/lUob7G69F2t9f
         vfMitq10YQi8UsUTW7Rl2DniCM8QVuuO2971W6AHuIBT4+1BnPmFrX9nPtG+9IAozvpB
         XWlvdQB49gvUBQ5TvIDfBJqVh//nKc3GKwMf3ETHBQvHiANfEL6QJw36C0B90KmY/BPF
         8hq0fFqO2lNGRirAJkxJuoiUn7vMiSYFNk85fB4F+Is57iHSNHbr5uy0eNHrj6k9MfE7
         AClA==
X-Forwarded-Encrypted: i=1; AJvYcCUJV6klU6L4kl/ioJd6Y3L9ZMU2GH9Q9/nxbB/IYdbc/tkYtTlbfktuVt2GgNDeS9ubj0w=@lists.linux.dev
X-Gm-Message-State: AOJu0YwHTEXtZw0f5ki27LciefRD3asong9zHe1ds6snUvwORdRmv8Rq
	BHQ6HMKUhqXM98m5HoEuWPAIaiNGFHIYc/m4D8Iqx233+34HknmCHKCQ3CU7As8=
X-Gm-Gg: ASbGncuyNW0DSmpPEd4+2h13bOFYtwamCTxe+ZY/7/JyTeCk+M65lx4fuQmNNpOH6Gq
	rJck/YTuAR/HmVFd1zigbK8AdSoXAfs5OXk3VrS/yEFLbYN4XnaO0w4+xIZ7yd1eADPDwYUQVHQ
	q36F2SbUCDQGYnBimjJRbM0h28dL4/5T6eiXRYZTdVCkeHyn0DcQhe1wWWpTxqQTr77WC4pbXpy
	/EbZl2z/N7WO2Zeo4JrQxAPPQVRsUbxxKr5bWSMNJojlRW5MZh3wiHkMxZNVMOSMeqcxERLWrQ3
	QDOKxHZo2S3rFYaitaTc2k2kd9+or0rzx7o+xcZzt0yaQiKTe4hIeGEoCqf9wOnjwMcDWPgBMVM
	=
X-Google-Smtp-Source: AGHT+IFKOZhRHtEHCCTN5BHVYVCPkFDsRkb7jCM4fs2ECH+kp2S3Jaa2qQ2qzrnOEoKDVZtT2N63uw==
X-Received: by 2002:a17:907:2d20:b0:ab6:b8e0:4f25 with SMTP id a640c23a62f3a-abc09a14d0dmr792407366b.4.1740509307824;
        Tue, 25 Feb 2025 10:48:27 -0800 (PST)
Received: from krzk-bin.. (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1cdbf55sm185359466b.15.2025.02.25.10.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 10:48:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jonathan Corbet <corbet@lwn.net>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] docs: process: maintainer-soc-clean-dts: linux-next is decisive
Date: Tue, 25 Feb 2025 19:48:22 +0100
Message-ID: <20250225184822.213296-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225184822.213296-1-krzysztof.kozlowski@linaro.org>
References: <20250225184822.213296-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Devicetree bindings patches go usually via driver subsystem tree, so
obviously testing only SoC branches would result in new dtbs_check
warnings.  Mention that linux-next branch is decisice for zero-warnings
rule.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/process/maintainer-soc-clean-dts.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/maintainer-soc-clean-dts.rst b/Documentation/process/maintainer-soc-clean-dts.rst
index 1b32430d0cfc..5423fb7d6047 100644
--- a/Documentation/process/maintainer-soc-clean-dts.rst
+++ b/Documentation/process/maintainer-soc-clean-dts.rst
@@ -17,8 +17,9 @@ Strict DTS DT Schema and dtc Compliance
 No changes to the SoC platform Devicetree sources (DTS files) should introduce
 new ``make dtbs_check W=1`` warnings.  Warnings in a new board DTS, which are
 results of issues in an included DTSI file, are considered existing, not new
-warnings.  The platform maintainers have automation in place which should point
-out any new warnings.
+warnings.  For series split between different trees (DT bindings go via driver
+subsystem tree), warnings on linux-next are decisive.  The platform maintainers
+have automation in place which should point out any new warnings.
 
 If a commit introducing new warnings gets accepted somehow, the resulting
 issues shall be fixed in reasonable time (e.g. within one release) or the
-- 
2.43.0

