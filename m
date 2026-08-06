Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BE71990A7
	for <soc@lists.linux.dev>; Thu,  6 Aug 2026 12:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786020514; cv=pass; b=RtG2j/CY6XQRc+PS/ULEzqmn1S8MD7N4tD8VAq7I0TnzJ7sy/+AYC+p20yDjCUjOQVUifNnF5Ndz/X9y4mlPZ2HsdOFwFl7YDXcZbXDYnFX7yXIiSiiTrn2BuNgFXRkRDF0mdYnPP79JIqbt3UZg2ZyfOuQf4gdGdf9dCv+btRo=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786020514; c=relaxed/simple;
	bh=gz8+lipJKJXH3SqXqv9GwQjvNmF6RbPglETVkdSvqA4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=S2YN6kCsvAJwSyy0EzSzc+9YsoOaTpngNYDwDiomcpGfqshX9OHB8Dx1LYwfz0Cypi+s+hobmlVfcjjt6bYWljboFWS+LnwwRuDjI1H3RPR1FHcWLvHNL6OvLsqGPLFHrIUuEnTIksngwdmtxs9XZZPsY3cUzopMZ7B+mNOlhUY=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b=xYe8CZ0P; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b="xYe8CZ0P"
Received: by smtp.kernel.org (Postfix)
	id 391C91F00A3A; Thu,  6 Aug 2026 12:48:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1786020511;
	b=WMRWta50M2YGg7iE+DjdEVnbu22j/NGCOFuPQ5XsRV0EfNUEfOnMw7qC+J1jJYOJLsJ+
	 v6luHz93WennJfi4nlGmmFmxe+XcPK+JkOgDDkqe9JaPEV4CYhZsWfLrGU6eB9xO6DQRX
	 5sL5nguM1vNTHBea88Zh9rmgGp5trd6mF6kg/9veTweNc+3LsTwbq5BjuuGVfx+uhLEZv
	 xdMTHfZI5Vt+2DFnA1fJ3p1Nl3EM8hvtv21bsFcF4rX5HdhU80fW5f5pCgR2MN3JUTZXg
	 xF/eTGzidc1sNhd9XycodPuOgeLkO2MtVyEBeE4ZBgal9HFV5dwaJ4d0I+k3zFmt5cg==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786020511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=rK7SgWeN4f2FHFvfgpmaRDRQvXv5DUIRMJ6S4fCNYSE=;
	b=DobiqE7f8qwe4yblY/jZpM5eP4hnwsYdIwQkV1qAQQJEkvLPDWNAMRdh7bViC1aiKTyn
	 ZjBX0SMbEOdt4dVVcXkaXiljqMuVTMWLLVWQHxi1ZVfn5EgEhCfkt6wESKOC6gNghHd5B
	 1K4oj6VMTbIr3CuD4pmLuvNADYI53qZl9fkVou1uS3+VN9PDd3hhBa5iETQjQY/zs20Qu
	 4LyJOhfVRNKKOvZ4+ZbLFeWTO+Pn6NSlpqbogFKVamN3QMYA94CmV1mI+Bt0XagVT8ArU
	 MwwLPISRmUYK2salhbmXzXhdETtDgNeVIq9G1maRm/rt6cQwXR97kRXyzOLgQ0FfXww==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=xYe8CZ0P;
	dmarc=none header.from=monstr.eu;
	spf=none smtp.mailfrom=monstr.eu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 866E11F000E9
	for <soc@kernel.org>; Thu,  6 Aug 2026 12:48:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=xYe8CZ0P
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 866E11F000E9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-668c1b780e5so3146409d50.2
        for <soc@kernel.org>; Thu, 06 Aug 2026 05:48:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786020508; cv=none;
        d=google.com; s=arc-20260327;
        b=LEbeIC+F0KsQ1WxPDL/1LgoCKTAMEjmPxShF65RpT3Q66xZdU/AhyVF1NJvKeX9dsE
         rbZiSXtcbC3VXFocOtXeji3DaQKbllaSRpNDNFhmtJDxkZ+lTpL+tg7lkZ+0aWSBJE8p
         X5SZphbzjgfbB9uFBnbPO4vu3zvwxUqa6ts03p5m88oaEEqaO9BG8+hX1aL6KmGPGVSN
         EWjWbXhc80GvCMLPCd6i66/xB4gm8hVY4RF8/hoJMdUcni/aYtm9v5rhGnOPP9EqRpnq
         T8/TZJOIlcQz1UkznwavHHm82T2At260UL2dWuJS6719PklcsT4dCCh6R0qkFWWpZK3E
         nPIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=rK7SgWeN4f2FHFvfgpmaRDRQvXv5DUIRMJ6S4fCNYSE=;
        fh=USfxQ7v9YbbgbzUCK5rgK5xnF5L0usnYcuhWnAGI6mY=;
        b=j3b5Zwf+/8m0eaRsUh4PXDiDOilZNfqjiadv1niCNLiGKjSLgjo9MzUU3i2GPngQV4
         s565k+pfGpkWyTJxDMDHt6qN6cTKBb3t9nge0/LKqm5tU6Mtw7rVLXxtCsM3rYNSlEgJ
         1DCt7KGK3M14Bo5g2s61NZTkMcUp9TlkIjl8cnogqSp/I1TNQ8COoo60OUVijyahdF6t
         U3lcbKdHvnbk4xJvY7t+WZEramjzyMrvJlCOcslLDIc2cLIMtEEldJeMnvhzkkc5SCB8
         34xRS6hWLv7qr5GFJuM7h46DHEIagJQ9rOprs9r83QFrjCV3Fx9gFynP97YElcdGyaU7
         C3Lg==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20251104.gappssmtp.com; s=20251104; t=1786020508; x=1786625308; darn=kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rK7SgWeN4f2FHFvfgpmaRDRQvXv5DUIRMJ6S4fCNYSE=;
        b=xYe8CZ0PfVZhqSaCb3BGG7lpIxwkoGcKzABvsmD3Uj54gVjA8P1BNJ8HoxWrP48W/6
         Bo7SJAxQZgIW1wu+cUd0Q00xpeMhWg9i0Ilw/U0QeSutFphAW9a00l/TgTzJRRbNkvhL
         PtLAss67CLFuO25DtPLTXBqhIr/Fzxj5iHQzYH/C2ioT6kPcni6e+3eTlM6HKW3hC0CG
         7Jofua/yMKGxYSX59Mf5celZ003beDbGWdapdQV5wtsuXTwEMe+FSApfRHb6C6i7JDr4
         cJj2IGEXUXoRCJFC4UCBbJQ+pkq/i48ttjEABPR1pGEbJIyabgV1nk4nkknfU0qJBtwk
         K4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786020508; x=1786625308;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rK7SgWeN4f2FHFvfgpmaRDRQvXv5DUIRMJ6S4fCNYSE=;
        b=p0RqOc0IZLuztw4WQGM7e7vLRFnHY3LSeh5+22lUIQfySC2oZLg3bItEpsNo7dtgIQ
         OYikP+AuudFzWe/5MOrQ59QJMHrlXTxBDppwbHeXm5ZPNwPrCdwnNNvjS+ipfV80wDtK
         cfdrDaiTq02W/r7mSgZLWiJzWzZFpk52sRnfF+miGqbOUe4IqMpNAfyK4w5L1MhSclV3
         P+cL6ddvuRBP94hYsQTVAjyCjXtxtnZxC1AT/NhXlNkBqxXSl8yFmeUZn+g05D2QdZBy
         rjLby+VW62zQ6AmLFH11uQ0ldSWJateD+owrQQzbKGj9rhrXCBNOJkMZGigwp1iLHbat
         VKOw==
X-Gm-Message-State: AOJu0YwPsA5e/UcFuuhvW9OIetPCR2VPloZ8CqgpnMzt2dXmUsqFIQTl
	DJOcyhoxGENpeBqavG6y6RqCz6NEf0GRxfaPKZEWF827GCAt/UDnv0qVjFMvgtn9i1w9KgcyYZl
	Xd/nsi7xDQvkOwnnw5kxxoxd5AWmoXjl8tzyV7wDln9Ep/F6WW/EVVJvpQig=
X-Gm-Gg: AR+sD12u7Kg9BzZ00MOWjfxhxfd81Pz8vKzOlVGIGjbYU/4IyBPHV+qEMth6bKcVT6b
	fHaHAUcw6Jo2XMxYtqbaV44fw+ev6ZAn1SDWMB+aFvqXeNE6Fj2ac09GXUz8vBvnpd5FXWid8ed
	R5zGYFYlGUE2bJTjqjeHd277Zdarb8ESYyji0ZWc5VIenG3HeRxpFQw/o3/VqgEo8+Mb5NP/Tqb
	gxka5aUXfjKzgvjpyLpuJroKWjF3wkdC6aV0NqTq9Hr3p+8RmypPLOEYeFXMjP0UcUAAWQg9T/k
	GzBtS1pLws6QQ99kryXTTN1GN7KFWH16QjABpYWQgitEQTQdxAdz/o59VQTgImhp/HVKxP7VifD
	IlfWGnUAwgKCU
X-Received: by 2002:a53:4206:0:b0:660:3426:3fe1 with SMTP id
 956f58d0204a3-6699aa4a50cmr6299399d50.24.1786020507983; Thu, 06 Aug 2026
 05:48:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Thu, 6 Aug 2026 14:48:16 +0200
X-Gm-Features: AUfX_mySjTng8JCgS3vhMm8N0h6IDOmP9gM8LKYzLmyz-LQZnRP_UD9sRmPowLU
Message-ID: <CAHTX3dJYaEKp_3WH6Xj_t6qHNGUP_nvRNcASA8hrToadsTeDQw@mail.gmail.com>
Subject: [GIT PULL] arm64: AMD/Xilinx DT changes for v7.3
To: SoC Team <soc@kernel.org>, linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

please pull these DT changes to your tree. I have put together arm32
and arm64 DT changes. If you want me to split it into two please let
me know.

Thanks,
Michal

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-dt-for-7.3

for you to fetch changes up to e1ab33a3b2892f56102ce90b20d2445847e758a5:

  arm64: versal-net: Switch Versal NET to firmware clock interface
(2026-07-21 09:53:48 +0200)

----------------------------------------------------------------
arm64: Xilinx DT changes for 7.3

bindings:
- Cleanup xilinx.txt
- Update ZynqMP firmware and clock descriptions

zynq:
- Drop bias-high-impedance on SD

zynqmp:
- Drop bias-high-impedance on SD
- Correct indentation

versalnet:
- Enable firmware interface including clock, power and reset

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      arm64: dts: xilinx: zynqmp-sck: Correct indentation

Michal Simek (8):
      arm64: dts: xilinx: drop bias-high-impedance on SDIO CD/WP pins
      arm: dts: xilinx: drop bias-high-impedance on SDIO CD/WP pins
      dt-bindings: xilinx: Remove EDK/Ethernet references
      dt-bindings: firmware: xilinx: Add missing example for ZynqMP
      dt-bindings: clock: versal-clk: Fix mio_clk index range in
clock-names pattern
      dt-bindings: clock: Move xlnx,zynqmp-clk to its own schema
      dt-bindings: clock: versal-clk: Fix Versal NET clock validation
      arm64: versal-net: Switch Versal NET to firmware clock interface

 Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
      |  93 ++----
 Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.yaml
      |  68 ++++
 Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
|  15 +-
 Documentation/devicetree/bindings/xilinx.txt
      |  98 +-----
 arch/arm/boot/dts/xilinx/zynq-ebaz4205.dts
      |   1 -
 arch/arm/boot/dts/xilinx/zynq-zc702.dts
      |   2 -
 arch/arm/boot/dts/xilinx/zynq-zc706.dts
      |   2 -
 arch/arm64/boot/dts/xilinx/versal-net-clk.dtsi
      | 345 ++++++++++++++------
 arch/arm64/boot/dts/xilinx/xlnx-versal-clk.h
      | 123 +++++++
 arch/arm64/boot/dts/xilinx/xlnx-versal-net-clk.h
      |  74 +++++
 arch/arm64/boot/dts/xilinx/xlnx-versal-net-power.h
      |  38 +++
 arch/arm64/boot/dts/xilinx/xlnx-versal-net-resets.h
      |  53 +++
 arch/arm64/boot/dts/xilinx/xlnx-versal-power.h
      |  55 ++++
 arch/arm64/boot/dts/xilinx/xlnx-versal-resets.h
      | 106 ++++++
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
      |  41 ++-
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
      |   1 -
 arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dts
      |   4 -
 arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm019-dc5.dts
      |   2 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
      |   1 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
      |   2 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts
      |   1 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts
      |   1 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
      |   2 -
 arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
      |   1 -
 24 files changed, 818 insertions(+), 311 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.yaml
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-clk.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-net-clk.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-net-power.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-net-resets.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-power.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-resets.h


-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs
