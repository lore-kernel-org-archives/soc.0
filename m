Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F1D372B42
	for <soc@lists.linux.dev>; Wed, 28 Jan 2026 20:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769632509; cv=none; b=EtVGwvvRT5fJmQ3eWHOOn7rewsoDmh05IZwpqyQ7vz2xw4Ec02dyZeKIZWuq4rdLQYlw3XLy7G38moPQGRN/cWkE+rw0i7coCCmHFsZJsywDGxRsbpb2EfcRf8HxZrx9ldv9SAgufcg3CvF6sTyIQ78uuWQ9kAaLNKjr7twRNN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769632509; c=relaxed/simple;
	bh=an791hvKKKAscXeJ/Fiq96ICCIb/BbSCjEVq7BghZTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k/kO0s6vjVGxusFt3C1OhjkpyRveco1VZqwUzCA2RsiEQaPpr0/sURRrH0HkPk1mYQIa+OoWc/lT+zcucTpSN9iJjN8wdaTmOa13+YKZFERQqBkX4gVvyJJ962I9r5QE0AazixEVUCyRlC4vnLRsA4jlSSadUnf4zAbMMnNSAEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UJ/PU6W6; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJ/PU6W6"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4359019da8cso232081f8f.1
        for <soc@lists.linux.dev>; Wed, 28 Jan 2026 12:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769632506; x=1770237306; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYZ9rfGW0tckzimm929FE5Fy0C24TkQSK2Yn9ZYCQGw=;
        b=UJ/PU6W6AoDnPuzWsEMEXV9QL9zBJQFDmdfRzU8WqX9QrkDPwDBCVFvSBL/bXMIpdT
         L2mfOeMj9+7JMok1brQtieKG3PQGBk2P+Bx/3GrE+bETcw90IntSjFeHWmkiuT3d6baU
         fjc5zawzyGbq7FSZN24O1xJ4kr9Oq2NqEgubRVFdCzt7ds/q8/7g2GNJ6TBd1guYKhpA
         tGZUEBlxwkVVCg0IyF+X/q4izdY5vuUrvel/K5aBIAFIRfKK77ldNPhHQx/IjsUEmC0j
         9PueGg5CY1wTXbpstF33mZ2euI1fCnj7YQZCbBvs+/CyXZ7+hd2g/U5MK+XCbKTSfZ1n
         xQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769632506; x=1770237306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lYZ9rfGW0tckzimm929FE5Fy0C24TkQSK2Yn9ZYCQGw=;
        b=NiFl5o70/dxoF2jLz6ZsJc9pgNHwZ7K8MP2Wm5TB31grUffP53I74ac+JXn/kFpRww
         zUPPVMmdp1zfyKcopmfVU05rphf2g2q2PDRIjIn6+C2Iitc5f8Jz7j/MZuza+E11ATrR
         dCUatjfNXza0ITZVwLRbG9FTL1YUnNb0UWyAlctckiwQIiVKHKvKsx1o8lZGsBtTUwkO
         M6/PGPsUcTCPSGH5VbtuKJoGhXu/bGeTLTXu9VNX8iVhRA9HP6xIc488jir3reGgpNXZ
         +9PG50hNZrL89PAzHVjaXp4mOm9CPlLvD9lsEMchBad6dDhwzqaqObQALx5B2bEJ2nps
         WtxQ==
X-Gm-Message-State: AOJu0Yzgj8j9bZwqhO4lfecyAIk/GlkbCqy9kB3II+a8r7Ubg6jsAykj
	NuEgPosxeHdDB0flBuHZobuWXntsj1w4ozpoXa6xb8PwEKyyO83oInLG
X-Gm-Gg: AZuq6aKo3YXGzG2QKLjX/6oI/xpLiQAuqu6utYsM8iKLfMgJdwZNVi4nqKW1nQqRWuy
	OWVRqAsiF2RBENvbnLy5J7fVgOelOxjvA0KQfdPj7b0KB7rR/hMiDh5HEwH25lMhHoQ0+MrJ28b
	btvOxCwN4/tKp5NA80ZTEq2lI1TVn/VwFr6KhQrUsqPU2PMsDj90nGeHHphFYqYLTKkV3DHVAL/
	gJTN/8JVjAJdDCBNzYu9yo8x60ZmJZtzdScXnDndykH1zeUnp6S4zp2/yM7qURPWAxTdZbbiQrR
	AVLByFf1GbZkq+ZmQ7LFVsdRcIv1GcS8wU7euAH2v8CkYDyWgGVd4zFiE0DnjJQ51vXCOqaACxk
	DJweJ2gak9wnxbZAxa0AMcqXnB02sGPgUbDBoJztEo2CImKvyUU5k7zQm6poP82Hc4atnCFa1mY
	vqk8s13/0fZmGDOIOrl7einhMl
X-Received: by 2002:a05:6000:288d:b0:435:930a:658e with SMTP id ffacd0b85a97d-435dd1c95cdmr9833119f8f.53.1769632506305;
        Wed, 28 Jan 2026 12:35:06 -0800 (PST)
Received: from strix.doe.home ([197.250.227.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee04csm9577644f8f.12.2026.01.28.12.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 12:35:05 -0800 (PST)
From: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: soc@lists.linux.dev,
	linus.walleij@linaro.org,
	Jun Nie <jun.nie@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Drew Fustini <fustini@kernel.org>
Subject: [RFC PATCH v2 2/7] dt-bindings: arm: Add zx297520v3 board binding.
Date: Wed, 28 Jan 2026 23:34:50 +0300
Message-ID: <20260128203455.38569-3-stefandoesinger@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128203455.38569-1-stefandoesinger@gmail.com>
References: <20260128203455.38569-1-stefandoesinger@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a compatible for boards based on the ZTE zx297520v3 SoC.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 .../devicetree/bindings/arm/zx29.yaml         | 20 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/zx29.yaml

diff --git a/Documentation/devicetree/bindings/arm/zx29.yaml b/Documentation/devicetree/bindings/arm/zx29.yaml
new file mode 100644
index 000000000000..717ca6413993
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/zx29.yaml
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/zx29.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx29
+
+maintainers:
+  - Stefan Dösinger <stefandoesinger@gmail.com>
+
+properties:
+  $nodename:
+    const: "/"
+  compatible:
+    oneOf:
+      - items:
+          - const: zte,zx297520v3
+
+additionalProperties: true
diff --git a/MAINTAINERS b/MAINTAINERS
index 225392cf3b5b..0989b2c6c157 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28394,6 +28394,7 @@ K:	zstd
 
 ZX29
 M:	Stefan Dösinger <stefandoesinger@gmail.com>
+F:	Documentation/devicetree/bindings/arm/zx29.yaml
 F:	arch/arm/mach-zte/
 
 ZSWAP COMPRESSED SWAP CACHING
-- 
2.52.0

