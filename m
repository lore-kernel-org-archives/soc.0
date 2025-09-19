Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8093124EA81
	for <soc@lists.linux.dev>; Fri, 19 Sep 2025 07:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758267827; cv=none; b=KTH5VbFnnxF4N6F7cg6xaNLjIZ52FrtX4/QgqRNI+wxeF4tLMJqF5lQuT58/teMAvy9w2un/Iwd0bd90f85hYIQNuRDSCdM4Cn/2Sygq3/MDXJ6ejchlzw4yrmOQ1VZ9xYnle0RZKpaVJW5wiMUiXdFUKEnBZ1G/zv5P23lcfXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758267827; c=relaxed/simple;
	bh=YuLtXzfcyFOWfWJ0Spz8pu50yc44luPWwkUgA8lyHVc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=bi6X19CtVzVgg528pHUq1O/CvCYAZFiTvJbZc3KnbNw79vLg0AI/i8aQPGxnnH8QQXWEKOblSvWHQjlzuPQoM8/WGH05Y4RwqVmlaUMEM+9HZ9gFrmLXiogfsnsQJQEuVBl+6ow2RxhxSsHQ1iVQo3+W+wFQJb7MaBI2/PdVOI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=USpwZw53; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="USpwZw53"
Received: by smtp.kernel.org (Postfix)
	id 2D298C4CEF1; Fri, 19 Sep 2025 07:43:47 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 22FC5C4CEF0
	for <soc@kernel.org>; Fri, 19 Sep 2025 07:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 22FC5C4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3eebc513678so560265f8f.1
        for <soc@kernel.org>; Fri, 19 Sep 2025 00:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758267824; x=1758872624; darn=kernel.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+s3KzlEou4Arh9IszQHrxspSJWPrDvVkQR1g8Npkl2s=;
        b=USpwZw53iA2e4mjPdf2DylUxh3C85U9tMnm3yP5P6dwXoe6NyDiewO2NuXvyjhPfcY
         A73URdFO5Wpt9ZBIKGsm+Uf/1ek2XWgbXZ6bGl9C8uJlK1i85gq985mTM9o2PCKOsCn9
         rQ/e1PhSKXTjrvEcwBr4G0QCioDOtLEqIr3H2aFMavNOeKHdsPhZdzCthPQa6iCy27Ol
         gMza9wYqgJvpgHYLrUuR2r0APlwD0zx4TySXAr1V1kl6LCysLZxsfrH1/8IFNr/gXpy2
         nlNKeUOUWax+8UlCjTp0+sbw/al22S981gmp31liUT3Euuic4bjJa1PpaMO3XjWRD8wq
         TLZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758267824; x=1758872624;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+s3KzlEou4Arh9IszQHrxspSJWPrDvVkQR1g8Npkl2s=;
        b=if1JZrFAD9USn9VOlnBFlUHJs4GsBqC5MMB9qy8LVA+CDhpc421pf+Zb6N4gFK3OcV
         qa/nBpj3N3F4cvH/FVG3/9pLTT23U3ezfyUqDzOV/uHTJwzfFbUeyW3sN8/y95Cck60Q
         OGSCqC/H8dG/Z3kArQtjxnVAGJbJAhHTxmz+3CS7WrBBilQqXcbWx0PuK2grWRPv1Uk9
         swYfMgjvxJtJdSgiTiJR76KIV/7JWq+K7ToEQ5+VdjBRgmfnuQIr0C+I1/Y6sxxoKz6d
         VkGx4J7LmrurraLBvfv2dZNhRHR6G7i+VIs2yhsrAi7v3e6z2y9LallnvvuBxFiPD8nY
         K19A==
X-Gm-Message-State: AOJu0Ywe6rJJxVUOPkrNA/rOqkKRxjj/KRUC5/oYYU6B0oKu+MdFdzsX
	DJ0NkL9pYWBSLpj/GzTYICX7cq6AvJ9tD46s/CMEm70xYwkaNOSn+8P04mWiWiOEEaIg9PshBfk
	qIXGl
X-Gm-Gg: ASbGncvTcjVjFYLtPlsjV28Drf7tQuAs3Cd6qhcT+bA/9BO8QqmVOuWZr0nLfKqPCAc
	FKrpciwh+pwbBah8p55ZuXfQJl5s1p5LozyIqBG7K+yQiR8revxtrzJDVzqIXDpPD4vdD53Le9M
	7xqGeaaR+4sRtQn1M0WvpSq49x5HzgJ79wNAmN9xds87jHnI9gs6LTQ4dwAV354H2vQQ1yv4jS5
	mtcP21RgEaG88yHkMk2nm/iKv6H0O87d9cvERt0ey6eRt+Cfm36cud16FLkqOLtWdJQeDDWu6Dw
	R785zSk3WWtxxoJznCzTdSBEBx/JAyyBH3wutJJS0MphXOMnPPX4aIlw1+hFtlXYmHCaxXWtRvj
	dxpyThEU32+fTtavu0R2Ftc2Ks49e1kPMuGoHhc/2thsXMNw9OeFLr9di6hp/JmmQ4HzLiUa6
X-Google-Smtp-Source: AGHT+IHcpJllzu9GwIGxRnbuf2O8B6mLK+lDLJvJu6rm63gNOYwmoqZg+mDrovu4zkhtTeyVh08/AA==
X-Received: by 2002:a05:6000:2681:b0:3ed:c9c0:73ce with SMTP id ffacd0b85a97d-3ee8407d43cmr1276205f8f.32.1758267824324;
        Fri, 19 Sep 2025 00:43:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:77b3:66a:b2a0:c20f? ([2a01:e0a:3d9:2080:77b3:66a:b2a0:c20f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f4f9f339sm84730655e9.14.2025.09.19.00.43.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 00:43:43 -0700 (PDT)
Message-ID: <003cb467-531d-4a8d-a97f-19d59154132f@linaro.org>
Date: Fri, 19 Sep 2025 09:43:43 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] Amlogic drivers updates for v6.18
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

Here's drivers updates for Amlogic SoCs, 2 non-urgent fixes for the meson_sm driver.

Thanks,
Neil

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v6.18

for you to fetch changes up to 0454346d1c5f7fccb3ef6e3103985de8ab3469f3:

   firmware: firmware: meson-sm: fix compile-test default (2025-09-10 09:31:20 +0200)

----------------------------------------------------------------
Amlogic Drivers changes for v6.18:
- device leak at probe in meson_sm
- fix compile-test default for meson_sm

----------------------------------------------------------------
Johan Hovold (2):
       firmware: meson_sm: fix device leak at probe
       firmware: firmware: meson-sm: fix compile-test default

  drivers/firmware/meson/Kconfig    | 2 +-
  drivers/firmware/meson/meson_sm.c | 7 ++++++-
  2 files changed, 7 insertions(+), 2 deletions(-)
