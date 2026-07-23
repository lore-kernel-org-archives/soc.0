Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C270138F95E
	for <soc@lists.linux.dev>; Thu, 23 Jul 2026 23:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784847751; cv=pass; b=m+B3l5oCnwRymA6DVIXqS2HdaaNUGoFTk1OUSQEw8ubEym1Lsq2ujXM2NfE24sUZ7oInaUPaOP62o17gmspfS8hA17guN0uCjVkbQOWVnHQ2gTDmQhZIlzTm68byHwB3JWfUW0vcjdiCMskOJG+XvN+310ja8QlIL3AKY6y2iwc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784847751; c=relaxed/simple;
	bh=RT5Uv7hBkjENHM0yE+r2AqpBTajOa62K/KccPqE5Uwk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=D2N+uv92E+d6yPkdAFUcW/YJrdLP12eRcWSrmcYt9ZfPzc5Y7AZZHOmWLWFMKtvux/yNXqjTxxyiA+2yEvbaWjQ4lOm9JfYE8Gk6vZm39SsM7m3YX2BNEmSfHul6BR3wBLcQGfNBRvvG3cJsLLpOlyOJfu/lm/5clKUKgfReBTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=22xPKoB5; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="22xPKoB5"
Received: by smtp.kernel.org (Postfix)
	id BD8F61F00A3D; Thu, 23 Jul 2026 23:02:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1784847748;
	b=I+n2cXwnhcNJ+5MEtOT6GKXoJkPEilMlyoaXiH3hbmUWxIz5izFkA4LeurSd8uoValKT
	 L132rrLNZpqU01Ek742NqCVuOo3iLzxNM2UDH4DH9ZtC2/OoOd6rOEuugX7siH/RF+yIO
	 oD5qpJMx1MwbRa6LdU5YaXhSOEIRe5l6naVOvGhDvgKgEw2BM4bfTod+nbuZoshGuiZc0
	 l4D78FqqVsNGpGCYZaw13iBzBVkoJ4/j/BruF2nj+NtE2ou4lP4y7rqopucLg6wzyhoL2
	 z0hj0xwWcmdJ6eFJc/b/AT+Qd2hRzFsGnSc9BYAGKA11kVKRzWsGiYGRjU9KB/lsTDw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1784847748;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=B1VWqfrwhX41oO9kNBmGr3imsWUDg1Cc0ShpaEM/OW4=;
	b=XxIneGGcec+e2IrCyWW28yBecnh+rrI9pE40zp66cd2D6Ahq6YcTlhpi6XgmVxSPNZ9z
	 +Dfkd+MPGVgWwE4QKAcpeOG0VmxikChMdYqrrwPDDf/Xm925a0F59APNco95Rg1CJ7SeN
	 7tnlDHSumrXv6uLVxy2B2erq2bP5Dq4MfOuzFqnWtxGlRICohWDuWKsM3oM2QrVPV6/OF
	 1SY2K5G9SG9IrzfCBpbOK5pBEBV2+sGDyRg4YxAFZYBJ3Dub/dmaTdqQXJ7rdfITG/Ol9
	 /QuS+HmPOQD+mJ7qYZ94RVooO/LLgli4D0R/lKFG29B+KS2a+uB3HvBGrYhPyYSmxYQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=22xPKoB5;
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2CA3B1F000E9;
	Thu, 23 Jul 2026 23:02:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=22xPKoB5
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 2CA3B1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=B1VWqfrwhX41oO9kNBmGr3imsWUDg1Cc0ShpaEM/OW4=; b=22xPKoB5gpO3UgxazGHw+xG8/e
	zP4Snp58FJbCsfKW0eHM04BOeBpq1qnaTW3wysTG3lnjQo6ZG4mt8dIxZ9dyRbM1zLJjqM1RNGTd8
	bHUvtXZh8S4kjx0eY9OVcwzMTtnNi+nfQcVyV3rm/DOgtOCP81/1s6T6InaJL0yD+yqWrCfSkTDOO
	a6LiQORNezglKHq+NLb5MH5jv0rfFvrcdw3FAflQ61tJt5c0HgZQMUckyBxvpHyinb9UofFctM+V9
	dfQ9/+MZTasdq9/tnX+EXmMiXoyf+a4Tc9dfyHqHvCIYExCHDANXcf1SlaaKUbvCrhvHKvfMfuR/m
	ceaCGROA==;
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip driver changes for 7.3 #1
Date: Fri, 24 Jul 2026 01:02:25 +0200
Message-ID: <4283932.anssfa2V6d@diego>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi,

Krzysztof improved the bindings for pmu+grf regarding the reboot-mode usage.

Please pull
Heiko


The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.3-rockchip-drivers1

for you to fetch changes up to 39eace59ac826465fae0788d0a6b304ec94f9944:

  dt-bindings: rockchip: grf: Narrow allowed reboot modes (2026-07-07 21:41:33 +0200)

----------------------------------------------------------------
Narrowing of reboot-mode definitions in the bindings for GRF and PMU.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      dt-bindings: rockchip: pmu: Narrow definition of reboot-mode
      dt-bindings: rockchip: grf: Narrow allowed reboot modes

 Documentation/devicetree/bindings/arm/rockchip/pmu.yaml | 8 +++++++-
 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 7 +++++--
 2 files changed, 12 insertions(+), 3 deletions(-)



