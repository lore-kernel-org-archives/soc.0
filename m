Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEE03115A2
	for <soc@lists.linux.dev>; Tue, 21 Apr 2026 13:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776779530; cv=none; b=q5KlP0pDmFgBcgJBj0bsnppTrQ8X+70Qb0Cf85jJr8w1GWCamvAtKX5v8XUzZgdCznU4amppgsWLWk9+XJpA4z0iU4jST55DY3esPc9VZpi0DTDpdii6IyiVmSL3dnAAqhZTMIUs/iw59GnRS6c/KvJMSii+FkyLvzDu448SBYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776779530; c=relaxed/simple;
	bh=bxTlfEqNKlfD/1zhWj2LkTSIBDsbTE5V59FoNHHBTkI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=XIxRfVNfnOlzX9g+LZmeE0WeALQVCOgW1t08fHtrtyXbPLn8zP4pxueV8RuqzKRCbLcYbpp8cMW1qdjR3hwSOvCBHOFzIm+L0F5lSX8PhyWhWTFyZvKUPARY/JbONwJsTmPYVsgI8eopAj6aE73VniI8V4taH9/6OnKhAnEsTOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D+cn4Kwn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D+cn4Kwn"
Received: by smtp.kernel.org (Postfix)
	id 2264DC2BCB7; Tue, 21 Apr 2026 13:52:10 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1E2E5C2BCB0
	for <soc@kernel.org>; Tue, 21 Apr 2026 13:52:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1E2E5C2BCB0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488b0046078so39482375e9.1
        for <soc@kernel.org>; Tue, 21 Apr 2026 06:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776779527; x=1777384327; darn=kernel.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jZ1Sn0x9mZvYh8gn/3N1aTOHuBkEI82dIz+RlHb/0fE=;
        b=D+cn4Kwn6/HoM0kCp7R9CbDkivb7XxBybgvZRJtqOhvz+MtABPt2WYbbh/E58qs2rQ
         n3/3czzUz0BKuEvm6EkInWC+Yq8cQyaT/FUphAccynoZqAXeJv9gkmfSY+qriliBLGmZ
         DjWvL0+xDPU2UzmkSfm2WlS3U90G/ey6pzC0EJHxUInUq22cGf+aBhpYNLHyXzfIn3HK
         2LgYj8V/PmBvf9u9xaaxV7sQJ4tJdVApC611fOmfmhFQzvc4sRrjdQlBWEvC1389c49T
         ls3yKYrg0iJbH6BpgNpFXPMYWHx7A6BUAQdGW3XOE0RDGWlEcHCTbgQpd9o7lY6D5wqe
         OE3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776779527; x=1777384327;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jZ1Sn0x9mZvYh8gn/3N1aTOHuBkEI82dIz+RlHb/0fE=;
        b=eZG/x024Q2TJPQTsGWggIY4aTtEXAaIgDXpuGBRbUhVnAO70BN7c/BzYM0k+Lhw72e
         9gYZrKYSFt1NPgK4flhlfHCASANYA0US+ksTfXFpKj2SJuFSXq5kaWbDPVXgH7ZJ/eKu
         i4L3rT+uDibzdSGGKdTDE6AXVjo3KNFESFUFH/RwA5oRQfrn1uRrYRcYXJn4Mvfwyrri
         UBCOzQUS5+D5kX75EHtejN4oeOWmEtvWWHkw/d70VIt/jBVpneDv6pq4FYbNOsZbBu8z
         2zTz81InL0l3B3JJBNRsYH3aM4rtmIuJdBQrkM8sqUmxD4yR5b7Cc6tuAG909mydg2Zn
         Dd7w==
X-Gm-Message-State: AOJu0Yw1xRQ11LPc+Qnu/7AUqyG14tQBsIHxzRxyqx+VChvPKsuZNw1/
	qFN2oURNyWeiAnwYB/IWvnwrY5lG15AybUQcMPkprtTveNVAyG61umVC8FS/AOaOvZZVk5SvfRz
	7WBcc41o=
X-Gm-Gg: AeBDiesEukApEXJoAYZ9GNCFLKkDQOhitz3oFX/RpH31hWloBvfRZc/S256vDU2DC09
	ZS9gPEK1RFV1IPEjf7iI/KQeIA2cIepNU27iHqcCXEa1qfL6y0N+oRwtiQVUkRf5OA2SnILs0S2
	/bNFn7ueqwkODUT74IU95n1EU0/+F/LH5oue/Lj5K2ynBxpJ3LVts8r5UnToXcFKKGqHTPFwRx0
	PK4XuD2k71ZmJMT8NNQTogEcVWxwCgO40uJbOAvTIyWiCXa5cruHI+fexrOOGmPwRdcPXB04pLJ
	5cK+O42Xm/BXBpTBwLw6CKFRMKv2tZYLr8oLuGuoRECcJzqDXvjuzu3HV46chDUHpNLznRy/RKg
	GF38CDjw8FRo3D54/0VPKyFx4fBfe662l4z7UJhAHmPlkikqeS0DiP+PWNBNXARiL+0ALgcpjUX
	a9wN0gNKaw5Zv0tAtDLvfx1KOYTs4wJtjAgH7d1Sqt4BbrT6RKXLFhyL9LZDkY7nyGQs+Hc6hdR
	lqCND7swMGW48VT+w==
X-Received: by 2002:a05:600c:b90:b0:488:b99b:4177 with SMTP id 5b1f17b1804b1-488fb78ee4emr249304235e9.25.1776779527194;
        Tue, 21 Apr 2026 06:52:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:4d7c:c818:d959:1c48? ([2a01:e0a:106d:1080:4d7c:c818:d959:1c48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ffc558f2sm235882855e9.1.2026.04.21.06.52.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 06:52:06 -0700 (PDT)
Message-ID: <536207a3-64bd-488f-a8cc-d61560b82ad6@linaro.org>
Date: Tue, 21 Apr 2026 15:52:06 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT fixes for v7.1-rc
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Here's the Amlogic ARM64 DT fixes for v7.1-rc, including a bunch of fixes
for the Khadas VIM4 and a couple of low priority fixes.

Thanks,
Neil

The following changes since commit 028ef9c96e96197026887c0f092424679298aae8:

   Linux 7.0 (2026-04-12 13:48:06 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-fixes-v7.1-rc

for you to fetch changes up to 174a0ef3b33434f475c87e66f37980e39b73805a:

   arm64: dts: meson-gxl-p230: fix ethernet PHY interrupt number (2026-04-21 15:46:29 +0200)

----------------------------------------------------------------
Amlogic DT Fixes for v7.1:
- Fix ethernet PHY interrupt number for P230 reference board
- Add missing cache information to cpu0 for Amlogic AXG
- Fix Khadas VIM4 board model name
- Fix GIC register ranges for Amlogic T7
- Fix Khadas VIM4 memory layout for 8GB RAM
- Drop CPU masks from GICv3 PPI interrupts for Amlogic S6

----------------------------------------------------------------
Anand Moon (1):
       arm64: dts: amlogic: meson-axg: Add missing cache information to cpu0

Geert Uytterhoeven (1):
       arm64: dts: amlogic: s6: Drop CPU masks from GICv3 PPI interrupts

Jun Yan (1):
       arm64: dts: meson-gxl-p230: fix ethernet PHY interrupt number

Nick Xie (2):
       arm64: dts: amlogic: t7: khadas-vim4: fix memory layout for 8GB RAM
       arm64: dts: amlogic: t7: khadas-vim4: fix board model name

Ronald Claveau (1):
       arm64: dts: amlogic: Fix GIC register ranges for Amlogic T7

  arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi                   | 10 +++++-----
  arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts |  6 ++++--
  arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi                   |  4 +++-
  arch/arm64/boot/dts/amlogic/meson-axg.dtsi                    |  6 ++++++
  arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts          |  3 ++-
  5 files changed, 20 insertions(+), 9 deletions(-)
