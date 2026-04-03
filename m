Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9D333E345
	for <soc@lists.linux.dev>; Fri,  3 Apr 2026 07:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775199830; cv=none; b=H5kHs0Qv655MPO/fF27z3CXOqGC9dZ79ym5qRkj7VV/25cmn2oi3puZrVuk+Rph7uHyJBzXCepWyVfCfjaAWNVSNbrXVJg8IZ0dpydY6asZ2NeQiQ5Sh2csBigutab+wkXZXuJPPWuv8HzzMNcEeOusHgzbnTmQZAiEihCuC5SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775199830; c=relaxed/simple;
	bh=Dut6otDgCg5ddGzL/iIfdoRncFvnU1VegwfxdTGwpyc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JkGTMtxA+gU2xhArGV4Yxpl1HOowdbEDqSgfuM4PbTXEgTwQA0ZmlxWz/kLS2UHvYQvX0d1zmkNF2MlCFz/40H5w0+TW4hdn7hHx7stdUU6FrXXfoqjUKdDgitW1lcvOFwu9kyATtMKCkG5yrAyxTy7Sb+XGNhVCbQYXGVGefjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=LA8EcST1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="LA8EcST1"
Received: by smtp.kernel.org (Postfix)
	id 3338FC19424; Fri,  3 Apr 2026 07:03:50 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6F796C4CEF7
	for <soc@kernel.org>; Fri,  3 Apr 2026 07:03:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6F796C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4888244e9f9so14282015e9.0
        for <soc@kernel.org>; Fri, 03 Apr 2026 00:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775199827; x=1775804627; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vqnTFhR30A/TR4noz6Hyn5T24eQZrxW2/g5X6NMsOb0=;
        b=LA8EcST14550dKx1RHJBeoDjC2PE356ixm6Df8uM0Nu8qW0ih9PFH+5hpls9bvmLJy
         EScra16SWn/sjvchfDrwZjksCgdJFmD/Vfkqa6EgW25/aCHQcF9evIz9dQM6fkLoqBek
         sPLxx1/p3nj4wdDmF4keoq10wXOOfo3lxaCEZoxzq/wvOUwZEzv7Gs+glX1FR7LnAZEM
         kG9RYMba6ZG4s7Gv3cTtTktZGwDLqjCvtECEIzD8cg1w3WbGd63ttuBYW8y37c2T6zvm
         3nobeoyKW0qn/ix5whawQAY26v2iFmAt/JhSNCixtaOvWe7HTb2tkrMU9h5fI1nB5Cq8
         lbxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775199827; x=1775804627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqnTFhR30A/TR4noz6Hyn5T24eQZrxW2/g5X6NMsOb0=;
        b=ZpNSedeFua7N07WEXYchG7mVz9NZj2a/iH3Sfv1Og9Id+hqMJju+pV4trl8IHxvggs
         +ww2sMoQCnfC9RBAXUEIClCh3Xn+cN0v8G8V1FhCcJ/L5caJ7PAHs7vSlS+a8vSRGPoK
         aR4EVSV9rHODjr8NrBA0mJLogHvoduvwvVY62Lg1dNr+I78M5pVgkeZvtPbxlTX001s1
         4MdPGRRe2i+3tLecZGyTRaMX2+pFEa83WNf+XvOOoxnQCWFvbRUdUgX6z3SGoibMtGa5
         DKCJtkUwx5SerSZldD972ezw3sE26sgoBqbJN30B9jvx5DZoZtoHhYQ+Mwe5fBQUOUtI
         TKIw==
X-Gm-Message-State: AOJu0YzM2jUlu9W3CqjRZR15yIlUB9u4xfUlm71dIDGsYB1kxTLM4i7d
	XEJwAYTxe6lGE9Q4xnulkXKy+oLMFLy8DKNPKXr1mILub7CsXiwNpJoqIPsoSfqB41XpQQofqTM
	H/Hg0
X-Gm-Gg: ATEYQzwCaWSG2/noDqKNNnZwiCdhiCy568zkjBmEkdNG8QqmNYSwHnaEhsO31W9/0hH
	C4L3dI2jEkqHhAPOGNEFAxc6mpF5wXGvVP1PFZcCzw9e6Ew0kH1iDF7KNkqePVZz+BDoqzcY+rA
	bWHOHcyrV2xrSKFcca5Rg8OzPv7HtSWXp3+Y7W5IKoCSw7/w7GHANXUKI637gK1P0OZPBhMLiSp
	XayeQ3qyoI6lgDT1wB1+weSXfBHWdd51RB08pGAgF4A3OLqYPKlvMWqSmbB8lYrVnfJoSDLEl2/
	oHaAAIiaiTYbGrzG3cgN0DIWGeNDt0eXMzq/qjP+NaR2QLUbbhr/cZdLKFPi3FC4DtHszZ9tLSq
	/q8HLe61s74VJNHBMjWdn0X1+HU/lKpml5AZxYDoUpoXYQ1mjW6kcnNfW3MD2ujam+dt/dqcAVU
	77LlUXFDtXfN6MXkBe0UeIUQK4fd3z6rC+dOxVV/qanbxNibkLR5W5
X-Received: by 2002:a05:600c:3544:b0:486:fd5c:2b35 with SMTP id 5b1f17b1804b1-48899735bb2mr25152895e9.13.1775199825786;
        Fri, 03 Apr 2026 00:03:45 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e967badsm323261125e9.14.2026.04.03.00.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 00:03:45 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: soc@kernel.org,
	arm@kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Microchip AT91 SoC updates for v7.1
Date: Fri,  3 Apr 2026 10:03:44 +0300
Message-ID: <20260403070344.2553018-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-soc-7.1

for you to fetch changes up to f3ae0049ff8a3d2cbd8c05857705744435629d0c:

  dt-bindings: arm: atmel,at91rm9200-sdramc: convert to DT schema (2026-03-07 16:41:03 +0200)

----------------------------------------------------------------
Microchip AT91 SoC updates for v7.1

This update includes:
- device tree bindings conversion to DT schema for CHIPID, RAM
  controller and PIT, PIT64b, ST timers

----------------------------------------------------------------
Akhila YS (5):
      dt-bindings: arm: microchip,sama7g5-chipid : convert to DT schema
      dt-bindings: arm: atmel,at91sam9260-pit: convert to DT schema
      dt-bindings: arm: microchip,sam9x60-pit64b : convert to DT schema
      dt-bindings: arm: atmel,at91rm9200-st: convert to DT schema
      dt-bindings: arm: atmel,at91rm9200-sdramc: convert to DT schema

 .../bindings/arm/atmel,at91rm9200-sdramc.yaml      | 66 +++++++++++++++++++++
 .../bindings/arm/atmel,at91rm9200-st.yaml          | 69 ++++++++++++++++++++++
 .../bindings/arm/atmel,at91sam9260-pit.yaml        | 49 +++++++++++++++
 .../devicetree/bindings/arm/atmel-sysregs.txt      | 48 ---------------
 .../bindings/arm/microchip,sam9x60-pit64b.yaml     | 68 +++++++++++++++++++++
 .../bindings/arm/microchip,sama7g5-chipid.yaml     | 41 +++++++++++++
 6 files changed, 293 insertions(+), 48 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/atmel,at91rm9200-sdramc.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/atmel,at91rm9200-st.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/atmel,at91sam9260-pit.yaml
 delete mode 100644 Documentation/devicetree/bindings/arm/atmel-sysregs.txt
 create mode 100644 Documentation/devicetree/bindings/arm/microchip,sam9x60-pit64b.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/microchip,sama7g5-chipid.yaml
