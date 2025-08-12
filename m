Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805A22DCF64
	for <soc@lists.linux.dev>; Tue, 12 Aug 2025 10:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754995323; cv=none; b=LabJjBjO1JE6D8Z+Um85WIHPxfn5OBgxFrghTvCU3MpjVluGwRxPKsH5x+S+xJ9ahaV0YLyr5As1JXH4CBZDU1m+Hfk2SPFswIe8Vc0lLPfwcgIGBJ4XOz47ipXZSn92ls+ifxarKROcXdEsPneZ1jh0VoncLV8QDoFYjWfgKEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754995323; c=relaxed/simple;
	bh=btAyvRtmkbXxP+i+9dkWP6dlhtZYn7iXm7lHIO+hiSI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H329/mAlzZ/xreB+2ueP9RfXE2v/EDjBxe9G9BbwHyNpmcsmYqsi/8v85kfwOH3JwuEFjlqvbTO88M1uC8Ksog14JlrRQLv1uZuGeDJW+/eCAsV7IhwoTGNwdUSfH42YSsgICUDdbs45+Wq0ZSmjqJX66S1WomK3TaqJdG310nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KFtSzwjz; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KFtSzwjz"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6155fbff3caso875361a12.3
        for <soc@lists.linux.dev>; Tue, 12 Aug 2025 03:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754995320; x=1755600120; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QAaiOy/N3h7yB/4dFeIEkdF56kDC1q6Gqt9cvra5SPs=;
        b=KFtSzwjzyOUWr//xq6oq5fKgRgXR14HKi6JO/wVJpbudfCV7YYgCjEEKyq2mdmtwnz
         cDhPymSi8SSSKPwIdgv7S2uNWuFuK777qjWeZF4e+0arLEQ6Xa4lM1QYP6ZAZHSEHKVu
         C1RzMVJoH768NG6GO+Kv7+XT0Dsk6kFW7oEH3VuIaKuhaaKKLjGXyy5xfEe/tpC3LHLb
         pAJBlAcr8U3m5bpmLSsZhWl+K8lJ867rv+ahL12hi28DHH3v0YdOwFUjj7doJqUu6Z0A
         0owtaL6s/tZuE+450HKRUvvaRuOzcA9r2MLDYTfZKek1Dw+qTvWaxjmYS0isy1jLrsHI
         Z3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754995320; x=1755600120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QAaiOy/N3h7yB/4dFeIEkdF56kDC1q6Gqt9cvra5SPs=;
        b=unBSaRu3rPtx9jyItoBlzRYTLv0xWA1Mt2gvVcaselw9/aZ9JQGKgKVmC1d2rFEjZf
         lX10KlmpZN8Jp8q8RWd0nkvMPQh2cKcbumfYl9OzGN+NEkxi4hFXWbm5FuUUoLk34UxM
         PVKeEpCv5oRx83zduNMsv3YBl5Q6C7XalpmwcvGSPotIFs5Ne6Y6rEPnpV3WMIe+NY53
         /F3Yf9pi47s7fD+dqC0mGqFjarOXq2GqHqJteQQQWO93Aa9ICMx6nWvFfuYP9X2EiDWG
         3JXhzerngM8XV+lr1eGcmu6c6OksVgJ8xlu8rLE0B1q6IDl/INXI6AzonTz9qdfuficE
         JeKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFKqT6Yxtgf7NNfn7qdUw7BjIQxcZkow7Ad8hFhxE1w4ds+dKGmxb55nUD8HV/6IaVdVw=@lists.linux.dev
X-Gm-Message-State: AOJu0YynlUybNPyHkllBi8S4l3TGmUYzrQRjAHg4GzVyLOmzeaoPGXiR
	bNxUQhTDlANu6ObVUEVoLTeR3sBEZEgXorsk3aQfG2oVtwQ/klX12jg5Fu5J3bQ4irY=
X-Gm-Gg: ASbGncvIbJkOu0NuOREL/OLVaLk/6IhjvYY7bt+v7shlzv9b7WVEy8u35rKLR17hDWQ
	NVvfnNE1AaQqFKW9eXZGnrdoKxSqlMYq7ItumP+X9bRux8IvIYDnOPjBS/mMzjc6ejEj6rvbolo
	YUddtYoW4hpgCxqz1VMEIZK56brZO8AqBjcFOfWlGh0O2Ut2PxtRPiWBuihj9uotP7IPU0/Rx1O
	HJNdiHY2dXrAy1MUggUcDGV0YUI1GVfZ92c+6XEZIAMqH74NZaQLuk/2Ao+QB2Bt2hnwD+hgmiK
	RlBWLHxxdlaKd5dhfmeCMQu7f7T6tOUzjnjqxXWhlxlRSQqf1Slt5U9TuuS1lbTnozUZ1jaBP1q
	7sJSMiF5ZrJVNBqraRrwSgD0zlYT5cKep/A==
X-Google-Smtp-Source: AGHT+IFVuPBX1WWXHjE5WiQCW0z9z7axEQSpNRILYD7CKS+Z1ca46MwosUVW2g0lgYDVQmrovf+vTQ==
X-Received: by 2002:a05:6402:520c:b0:615:7ba6:4876 with SMTP id 4fb4d7f45d1cf-61859a4adaamr378641a12.8.1754995319829;
        Tue, 12 Aug 2025 03:41:59 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6184b807728sm1460348a12.12.2025.08.12.03.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 03:41:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] Documentation/process: maintainer-soc: Use "DTS" instead of "devicetree"
Date: Tue, 12 Aug 2025 12:41:55 +0200
Message-ID: <20250812104154.42289-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2047; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=btAyvRtmkbXxP+i+9dkWP6dlhtZYn7iXm7lHIO+hiSI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBomxpy/fIPdRspqyjtDspdwQP8eCSdbbk/qvY1e
 4DUh4r8dLeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaJsacgAKCRDBN2bmhouD
 153BD/9pbsdOLBBjuH1T+Qx7JutSi91jJK1OztVssLYs4N3tTNF+Fu++ubUyfqjTPN9DDfUMc7z
 r8N7GY/iIODwgdDoMexHzoriyr70+llWuV2NjB6Nd4Xj9YHZXyxaxnhyhy+GJJ1SXRM3Pw919eq
 616seqX5p2xJqBexrpCIkRLpR3QNaEEQSCC41ZLQ2BJNqgxZAIKjrRs0pkFzMYB1QSIofSoyFna
 f9yeIBIJs9WND+wnezDp5bsBNIE7OkaPZrKwZ0bQPG3eVeI9m4zsCht+AsngcHv79+UG5dEQ6E6
 +9XrLuX3vzUyFkqQ6muXyv9uDNpFdwyeh7B3sd3ZUMezddVdjFBZnabjjUSLntgJuJFl0oB9YIB
 WeTPZ1LNxCaOkY59Jt+dSdUrarHHqxVsL8woIvnHiE7nQhspm4pnReYjzgIqX15ol/dgbDmiQ3+
 a7Xfr3sz3hvMC3ynzjpbZFHIkHlL5EvZ3ZUMO0ru24+KMxFqFNXBqDq/Ay2IYRBRcjMuQIxkqZn
 I5reux0ksT9YUxOa6Bv/K9gHFG+CSX1i+6ssJ0t688S8c+bYD/crDYQi4OZR1tPSkhMyo+aYevb
 Ca6YM98/dQ7Sc/Wm1cIRb7S2HtQ0kzggeb61K8+3DLwfR9swlMo6APbfYaCFZUa3be3Q281MTSi HBP/vBdc3HJW2MA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Devicetree is a data structure and it is a bit generic term, because
some treat Devicetree bindings as Devicetree.  What the SoC maintainers
profile is mentioning in ABI stability are the Devicetree sources, so
DTS files.  It is also more common during reviews to refer to these as
per "DTS" instead "devicetree".

Clarify that by using "DTS" name in few more places.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

This is a doc patch, but covering SoC tree, so maybe it can be applied
by SoC (Arnd)?
---
 Documentation/process/maintainer-soc.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/process/maintainer-soc.rst b/Documentation/process/maintainer-soc.rst
index fe9d8bcfbd2b..3ba886f52a51 100644
--- a/Documentation/process/maintainer-soc.rst
+++ b/Documentation/process/maintainer-soc.rst
@@ -10,7 +10,7 @@ Overview
 The SoC subsystem is a place of aggregation for SoC-specific code.
 The main components of the subsystem are:
 
-* devicetrees for 32- & 64-bit ARM and RISC-V
+* devicetrees (DTS) for 32- & 64-bit ARM and RISC-V
 * 32-bit ARM board files (arch/arm/mach*)
 * 32- & 64-bit ARM defconfigs
 * SoC-specific drivers across architectures, in particular for 32- & 64-bit
@@ -97,8 +97,8 @@ Perhaps one of the most important things to highlight is that dt-bindings
 document the ABI between the devicetree and the kernel.
 Please read Documentation/devicetree/bindings/ABI.rst.
 
-If changes are being made to a devicetree that are incompatible with old
-kernels, the devicetree patch should not be applied until the driver is, or an
+If changes are being made to a DTS that are incompatible with old
+kernels, the DTS patch should not be applied until the driver is, or an
 appropriate time later.  Most importantly, any incompatible changes should be
 clearly pointed out in the patch description and pull request, along with the
 expected impact on existing users, such as bootloaders or other operating
-- 
2.48.1

