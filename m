Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D069B22A4C5
	for <soc@lists.linux.dev>; Fri,  9 May 2025 15:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746805547; cv=none; b=WBhf8gIVORZal+eUYCx9+h0Ti2dB3OW3WhlrIZ3tpkE98xJ6Uv0q86t4h4r6u1QpoeS1VsrGx+rZxDj7IQIRn5Iw6c+diEvv4+eMMRD+ws8Q4mGw/LhlOMXZkuGQb+zqnZqATxfAKdUiZAC1CYT6+UitQHInPO/dne4h5crOs0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746805547; c=relaxed/simple;
	bh=HPB6IBP+bsWM4Mpypt78/h1MB+7mF4eC8AVmr+Zc72I=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=FdsaqiPrhL/KTe6hqoWgLI+YbgxpfDVTiikWcaoLZ4Di70dGER26ypHFQKp1C+XZK8iftKpFUkMtzQgwffR5MjFYAUGBsv5ivjEgY5ytIIRVdaf+KmMM49fvhOJsE9/wPjmMby+u4S5W4XgDoXsd86F8k6CyA/iJq005epN6plo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BJfiy8Sw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BJfiy8Sw"
Received: by smtp.kernel.org (Postfix)
	id 631F7C4CEEE; Fri,  9 May 2025 15:45:45 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 34F54C4CEE4
	for <soc@kernel.org>; Fri,  9 May 2025 15:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 34F54C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43ede096d73so15778035e9.2
        for <soc@kernel.org>; Fri, 09 May 2025 08:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746805542; x=1747410342; darn=kernel.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AD8fo2TbioxdBHBzGiMAUFOtmTrHt8a2YC2VBdFc3ss=;
        b=BJfiy8SwuVDM4aYCMaYQ/WQgjvfllmvFRJLkYSQEwBORzQ9aLmsGGT74C4iEAI/8m9
         PI4JQHsmUh66k/9xCpagHw3lCX8PtddtGRdrgOaks0OULN0SBHeBnVWjixgDez9hch6v
         4wzN41pg7WL7dZkkSX3aGka3AEzAd7Jk8aPN1131PfPRidx8bVWc81K9rGiVYyFpyCXk
         OmV6rVTxDTlHeXodTNN6Ycrca1D/k7drYN0yDmUZs0FnjQpkZ0C0yJI0DtSSE4Gxd5Eo
         wSFxTP+5K64tJWAF/s/CyjegMyNiobko9rCoUl9aFh7V/Xj5fDHaad20AnCBZUtns/rB
         cDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746805542; x=1747410342;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AD8fo2TbioxdBHBzGiMAUFOtmTrHt8a2YC2VBdFc3ss=;
        b=c+mcS7lzLLFVZUGTRZIFh1OKeDZisfPwA3Gkq8y1y30raYWvaPa/nE/0x/3g8XKk12
         r3+IBtLTfv8siNzj2TebxWC2XPA1qNDlRdt6XkQrwEms9fw0ZILgeOB4SqLHhKvprfGb
         bqaUexlSCdga84xykg1uCwErbcZo8LO9Z6l9CCRFP7j30DSPELRa75XbHvMbfG/J3A6Z
         CP4tqlq6c0hoLnpbAN5zZlqw12qrH4Pb+1fLMCzAisrL0psUDlLXEPBqlDQQoSxJt5M4
         3sMpYlMgrg4VRuNN1VoG0mCuDvzMuckMBM3HYtnctb1Rkvr4Tdql64y9X0QO6AvFvGdh
         3Z8Q==
X-Gm-Message-State: AOJu0Ywm6hG7g3GRXM1r9clIYA/o+lPQCZ/VW1sZHVCwqCWowK822bs+
	0oBbW9QuxwCM5DFviVqdog5aqbOYPMuaLn/5qnoLg0fyU/mn92oKo7+M9gPAlKDDnTpccwQ6MPC
	B
X-Gm-Gg: ASbGncuAtkfsnND2o3cPEbebbob9VzwL34yBSmQ/roljj0Xln4WNgGi81xQaprV5QOi
	sMNO5p8ZhMeuuUGpHH7BvbgleDo3Kq9xTXDotIRlK3ARYuJAcDFVAeQ9AVirdi076K9QmRmvhD0
	cWge4uoxocsERr4bQ9F5w2Kl0EHuTDISvU4gtlf44Jzn3YRJTHlx1NUH5E2eL9lgVqVAKva7uAg
	GkRguuO23zG6lYLVFgLZNDqhAzFJUrvXpyI0VIhftddT9pU+HtPuvkKeSlib7kqOvoMF38pQB3y
	qm3qPsbXH7kERqx8+gQky0GlbpokvyPTtK/sanYCwXJ1RMeyyWlt8imgDSc74ugVzR8R/JzRA/w
	7TTVwqqCPlb1BpoU=
X-Google-Smtp-Source: AGHT+IEDu0RmADt0QA6PX+zldOg7l+W1rhlKf41kRBI2/GfQDlr3pxPYPPmtAWW82aWDZ8qrzQJ2fw==
X-Received: by 2002:a05:600c:1d8c:b0:43d:683:8caa with SMTP id 5b1f17b1804b1-442d6d64644mr36882015e9.15.1746805542515;
        Fri, 09 May 2025 08:45:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:22d7:71a:9f62:f7e2? ([2a01:e0a:3d9:2080:22d7:71a:9f62:f7e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67df5ecsm33463335e9.9.2025.05.09.08.45.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 08:45:42 -0700 (PDT)
Message-ID: <e9c520a1-b986-49e1-b9b1-67511c187716@linaro.org>
Date: Fri, 9 May 2025 17:45:41 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] Amlogic fixes for v6.15
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

Here's a set of DT fixes for the new PWM bindings migration, and missing
audio nodes enabling for the dreambox DTs.

Thanks,
Neil

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git amlogic-fixes-for-v6.15

for you to fetch changes up to 0f67578587bb9e5a8eecfcdf6b8a501b5bd90526:

   arm64: dts: amlogic: dreambox: fix missing clkc_audio node (2025-05-05 14:35:46 +0200)

----------------------------------------------------------------
Amlogic Fixes for v6.15:
- fix reference to unknown/untested PWM clock on ARM/ARM64 boards
- fix missing clkc_audio node on dreambox ARM64 DT

----------------------------------------------------------------
Christian Hewitt (1):
       arm64: dts: amlogic: dreambox: fix missing clkc_audio node

Martin Blumenstingl (4):
       ARM: dts: amlogic: meson8: fix reference to unknown/untested PWM clock
       ARM: dts: amlogic: meson8b: fix reference to unknown/untested PWM clock
       arm64: dts: amlogic: gx: fix reference to unknown/untested PWM clock
       arm64: dts: amlogic: g12: fix reference to unknown/untested PWM clock

  arch/arm/boot/dts/amlogic/meson8.dtsi                | 6 +++---
  arch/arm/boot/dts/amlogic/meson8b.dtsi               | 6 +++---
  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi    | 6 +++---
  arch/arm64/boot/dts/amlogic/meson-g12b-dreambox.dtsi | 4 ++++
  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi          | 6 +++---
  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi           | 6 +++---
  6 files changed, 19 insertions(+), 15 deletions(-)
