Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA5924F5A0
	for <soc@lists.linux.dev>; Tue, 13 May 2025 10:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747131138; cv=none; b=nfLmAK8+IL7ugYpKnzohd8wXp/gfihyttKbau0fux14YQ0IRsMw+8/kZwb55hbDmK7ju2/T+lhK48X3piW7C/CcqRLv9Soiw4VY7RedqMsrHR0KdwJsBYdiVvtEbLFBSk2o12AiBpNukl5vx0/YAvRomC7tDUMT9HLUJsEVpUAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747131138; c=relaxed/simple;
	bh=39PJWrgol/Y6KgPadKjlisKAa+NSY9vqr8MZ+EEEZws=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=YXf/t3fiS5W+7P9eGlr/7IDUYCvYcpHdL3mN6Tq3MTu5qveno5sVjVbK4DQZmSLyPwT7fAfuWEZ2otxds4i/5ekIQm1s6xj+hKrW/QTZ1Kd707SXJBjkVZ1aOZxtwOMNUrfZA9a3m1whayuiOUwkajYW20VAwC7m0LuA6DYHuhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sdm6W+H/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sdm6W+H/"
Received: by smtp.kernel.org (Postfix)
	id 52FC4C4CEF1; Tue, 13 May 2025 10:12:18 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B5E39C4CEF0
	for <soc@kernel.org>; Tue, 13 May 2025 10:12:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B5E39C4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so56149895e9.1
        for <soc@kernel.org>; Tue, 13 May 2025 03:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747131135; x=1747735935; darn=kernel.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JJeqmvQf3UAL4kCovc4gGHXLVQH6Y8/QOMAb9LY1twk=;
        b=Sdm6W+H/HffjQyYt2YVZ/wX17msUNXFfrweG8r9BrHx1g2SNNZbU77zun5c4JVkhp1
         zQkCVNGZApUEauovdGrsbVhCM8lGRkKBKB1iqgNxKf4QY7phBQfjo7IoUq1bZR326Iwh
         3rjKTE9jWVXKMPCOGMDTWgIO8zA+RTvj2Z2pKKJ/CLXrU7hlUSutPM8qHhtm5a64n4Jc
         qXB5y2kfLzqtVCfe/8VFLVRtuZv3nOAFePzN/11BCdYwgbawL2B5UzZxXWI9l7r0pDEn
         KlSC1rrf+lShQmfmnuAlEz3ZSU9r1UBWrP8kbPU4xE8u1+O3+gLgBr2EgCwlfqWwaq84
         Dxjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747131135; x=1747735935;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JJeqmvQf3UAL4kCovc4gGHXLVQH6Y8/QOMAb9LY1twk=;
        b=Smo+PIhgUYiWsoDoJtef87w4sSvsixppHcpvJ22u57xACyhuCDOJU0KQkzTGuZthkL
         rYebmc+uXOmCDbhwJ7ErMSnFTwP9idF9FWll0zK3kqwkt+v8PYyHCDqJ5ohsIZBPI18H
         ZI4CJDcv1Dybmpi+4bGYTUTTvlBFjzkCnjki6LJr8eTdeL5nYXCQfstIWfF6WUc+77cF
         lV1YxqbXH72kQiPGIfsSXo8nXvayQGEerJ+9oV2NKlGZi07GwSeoOV0mEiBzBvROdcuy
         /cUGdBrgmqCxVUgnCzA01WQQNmLKJlsFPTqXZWd2Bg5L52JHujCxm+F50jkdUW+STWlt
         sMeA==
X-Gm-Message-State: AOJu0YzuXo3Aa5TegZk4qHFjCPKa3uMZ7r8mg8ru/3Tj73oi2TuLnXZK
	GwCkG87vViqf5OvE9+mbOvoQvNaQZi2vhSA4Yu0JGSYcOmA3RiFP/e6wQ+KrfgG98Be7baRAzvU
	RzmI=
X-Gm-Gg: ASbGncvDBo/BxNXmJR5WAeq7miCXUN0eWuf3zS2vzsekg8AlgHItLgQCULN8m21VWEG
	rfT2sZu6dgHUhCVTYNxX/17zmopTsxR2wngAIOCRtAtoU10gK4TRLyUyxk+0ynbAWQ/bSpJf1b+
	aCHpZVy3j2i9qGupkZb0GFcXVFS0Gkl620lyubksMAKjx0gH/i1ydQ+IQYcq0KRc47gjTF5VR+r
	K9nFvN+Cn20CQSwYNi2/B0H/TF6gthrZd86wFDdBo7OpnxcWfpgdg6uUXrYQzK+owmNz/+sF1Xb
	riK87LjIlgFxm834CiosgaKnaGcPFFQzMpWJx1PmxtW5PJTjc/1QZrEPSs7hTvXD6iSdHTNqeGz
	vTRPR2/4aD40V
X-Google-Smtp-Source: AGHT+IGkA3sY3L4MfFT9frruBvb5if6+w/Gw4kde8Il5ntffLfGLugxuM3zv1UQFvt6KFoEpgM+QbQ==
X-Received: by 2002:a05:600c:4e90:b0:442:e147:bea7 with SMTP id 5b1f17b1804b1-442e17571eemr76287125e9.29.1747131134966;
        Tue, 13 May 2025 03:12:14 -0700 (PDT)
Received: from [10.61.1.139] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3aeb6esm207550715e9.25.2025.05.13.03.12.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 03:12:14 -0700 (PDT)
Message-ID: <838c5305-5c5b-4232-b7fe-86598dc50ace@linaro.org>
Date: Tue, 13 May 2025 12:12:13 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM DT updates for v6.16
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
Content-Transfer-Encoding: 8bit

Hi,

Here's ARM Dt changes for Amlogic SoCs, setting pull-up for UART RX/TX lines by
default for avoid issues with debug connectors, and introducing the Meson8 based
TCU Fernsehfee 3.0 board.

Thanks,
Neil

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm-dt-for-v6.16

for you to fetch changes up to 2c1879a440315e0b292bbff0fa63a73bd8a52e34:

   ARM: dts: amlogic: meson8-fernsehfee3: Describe regulators (2025-05-09 17:37:05 +0200)

----------------------------------------------------------------
Amlogic ARM DT for v6.16:
- UART RX/TX pull-up pinconf properties for all SoCs
- New Boards:
   - Meson8 TCU Fernsehfee 3.0

----------------------------------------------------------------
J. Neuschäfer (4):
       dt-bindings: vendor-prefixes: Add TC Unterhaltungselektronik AG
       dt-bindings: arm: amlogic: Add TCU Fernsehfee 3.0 board
       ARM: dts: amlogic: Add TCU Fernsehfee 3.0
       ARM: dts: amlogic: meson8-fernsehfee3: Describe regulators

Martin Blumenstingl (2):
       ARM: dts: amlogic: meson8: enable UART RX and TX pull up by default
       ARM: dts: amlogic: meson8b: enable UART RX and TX pull up by default

  Documentation/devicetree/bindings/arm/amlogic.yaml |   1 +
  .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
  arch/arm/boot/dts/amlogic/Makefile                 |   1 +
  arch/arm/boot/dts/amlogic/meson8-fernsehfee3.dts   | 306 +++++++++++++++++++++
  arch/arm/boot/dts/amlogic/meson8.dtsi              |  22 +-
  arch/arm/boot/dts/amlogic/meson8b.dtsi             |   4 +-
  6 files changed, 332 insertions(+), 4 deletions(-)
  create mode 100644 arch/arm/boot/dts/amlogic/meson8-fernsehfee3.dts
