Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E5F86327
	for <soc@lists.linux.dev>; Mon,  6 Jan 2025 14:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736173395; cv=none; b=d0/AuyfDTE2XAtqezZuzYZ1XZvNO6NStj0oMl5cqtKusCV0RlOyuvbowAsznUodLnCwoa8q228ddAIuOfYqQ9DdeV43MyzYChDLXR25XEz+ySAuplfOKcu1QJpnQ8GnwkLT3xBBnh3mAQ9ex8vwsGwi6wp/mtSAATz6adF16QUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736173395; c=relaxed/simple;
	bh=u5XPkTOpWqBQzHRn3Y5dQ7bV6cYbkigV4SQt/QljSOM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=Ytov1VpuwMHVDIhMS8EpGScQ7vsnK4Yhq8LSqbfpsZCx0Zl2KV2lR40FDiMz/6PdNGPA/AQbbY+SXL4/Lu6/S1QzakLLACEJNa9fK5CnlabC+BMRaGTChA5ql5Z/ME151Hay+0Zu5EpBibyXVOiU//D4uoP6RGXLDTuqMvmI21Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xCnIrVbh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xCnIrVbh"
Received: by smtp.kernel.org (Postfix)
	id EE1B7C4CEE2; Mon,  6 Jan 2025 14:23:14 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D1571C4CEEC
	for <soc@kernel.org>; Mon,  6 Jan 2025 14:23:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D1571C4CEEC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43623f0c574so99168825e9.2
        for <soc@kernel.org>; Mon, 06 Jan 2025 06:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736173392; x=1736778192; darn=kernel.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v+ISvG17XlCRUc2+RRHh59wTwYCWMY/Hqwqq505SSb0=;
        b=xCnIrVbhfATAdekw9q8X2Jl8xLEk/a2bv3hjL3uI2ZO3TxvK94H7YqOYtG1oYunRQa
         CyjXGJk73ySGNsbrc1d1e4cBT3EyBV6w6Mx0hd3+uILSkuuNkKygCFEniXgfkqgVrabY
         Kz5aQg/bUrIBPGrJP8PsCZPoFb33pki9Kt5DxP+hGO/M96ORq+rW0f6mCCE6fabH39vC
         O6OHtZ+PCL9w1S/e9sg/OhZEU77f4ZjSzbeyvdaZM8k+8bvVGuGVmpXvLZouo9CqqS7Z
         EZ3emc8ENCsFN9oa4wY2uAb7tWISPAhCvvLmm/KIJEIzlqEGGX9/n5f4dgiW/jdXg9h0
         kCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736173392; x=1736778192;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v+ISvG17XlCRUc2+RRHh59wTwYCWMY/Hqwqq505SSb0=;
        b=W8DIevBP5wBM+tKKx6AYH6BAJ8CYvaiMT/wbQyRgyD/8fwGLWpcCmtURoZUhkVznO+
         +Zr82LZHn8+yTGaMLEL8tSVYYLdz+CA4FzOmVJOTQQD+mPehE2ypLgaf0Lckr0dV9DYP
         F+guqY4FKxYEnJ734vyLZUTIkO5ayXFKJRSzmojeNQlg5M0UE6Zhfizbsp01ciUAm9a7
         MhHZPKj/TeZfD8G023p+VZ62JcO+jks99+dvSabz30pqGbKgLvqQ/kkij1Qcs4Z1IIGe
         s5g3DOOZfn0rRYvmCNorlR9yFuCwpR+mrqe1oQbuw2r08lrpDIV8EEs4BFvGoBpqumDm
         w5iQ==
X-Gm-Message-State: AOJu0YxXyDsp4Z4nwoP0QgNfduYgiTf0ELVxciLldOVIUrq0YscH7Ta+
	KSWaQyg2ElnAF5ADl8gllo6l3kIFXgVmb5je/Ntxh/oNw0p3+78tHSwFfINhFDjk7sG9hIg6E5Q
	t
X-Gm-Gg: ASbGncumvL2TTV5IOnrUfW5Y2ED9ZghWsZxeDwoTC8wmVYOCI0zfGoQUBdiXnRFUikJ
	ekiLKMLV4A5vSEH+vkyJDOcFgqocu1HlOh9tsygoWKvgMMzyxAnJr80+0+yvZOyTZXk55sQNnuD
	hHuaFOEqoZaE86nu5LfVpzNhIOURJ/gkF3olgPew8gQ9UbW7247hCmXqA4fa/2XZXfro01RVHwq
	dZo0enGxmK3L4p2ah6vidai3xWXXhzI+jXqkgLrVWPRbosrugvpQx8XJBWyN1T63VS86tvojMlr
	YEbMAbokdCIsWvguDvbtCZWdKF4m
X-Google-Smtp-Source: AGHT+IFbQVoTEVhEDDdBwsowpTrnhU+0JKPMJ0XbhCvp1qdAqGclVtuhezzIVxR/+KsmGKTLOCnaDw==
X-Received: by 2002:a05:600c:350b:b0:434:f131:1e6d with SMTP id 5b1f17b1804b1-43668643203mr623670995e9.10.1736173392034;
        Mon, 06 Jan 2025 06:23:12 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:95:e905:1421:811c? ([2a01:e0a:982:cbb0:95:e905:1421:811c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661289d3dsm575723455e9.41.2025.01.06.06.23.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 06:23:11 -0800 (PST)
Message-ID: <72d71d3f-99c3-4767-8c80-8fa7a865c846@linaro.org>
Date: Mon, 6 Jan 2025 15:23:10 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v6.14
Reply-To: neil.armstrong@linaro.org
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

Here's a single change for Amlogic ARM64 DT, removing the broadcom wifi
compatible from the SDIO subnode because the Amlogic GX reference
board can be shipped with different brands of pin compatible SDIO
chips.

Thanks,
Neil

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v6.14

for you to fetch changes up to 1ba1964a7f83daae7fdeaf2de584a7ba758c4491:

   arm64: dts: meson: remove broadcom wifi compatible from GX reference boards (2024-12-13 10:36:02 +0100)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v6.13:
- remove broadcom wifi compatible from GX reference boards

----------------------------------------------------------------
Christian Hewitt (1):
       arm64: dts: meson: remove broadcom wifi compatible from GX reference boards

  arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi      | 3 +--
  arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts  | 3 +--
  arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dts  | 3 +--
  arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi | 3 +--
  arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts        | 3 +--
  arch/arm64/boot/dts/amlogic/meson-gxm-q201.dts        | 3 +--
  6 files changed, 6 insertions(+), 12 deletions(-)
