Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75A119C553
	for <soc@lists.linux.dev>; Mon, 17 Mar 2025 16:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742228172; cv=none; b=ukvSLDlQOnLdVyfqKNT6GfbV+ZzZtiqmsNntYlbmpS3diaL8pEcxr8RlBoeQE0DJQQAu8nMsLw47vu5HJImlhCj7wdLw43r2KIgDmw8UqAjdpD7M3M4/KSwXgvWpMpjIHTFm7434/K/S+0QLE8Q+AZAjWU1D6ZBpTEVxEoFkVPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742228172; c=relaxed/simple;
	bh=JB44IXH1QHHZXhNF3GMVHZCN/PZWjvdOqAoWP3hjPt8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=gYc2h4RdwInrykFBPeNBIY7MylFq0E0uJUZoraJgbgTxovlLtAPKrcBWoDAH3ohOhz2PBuO1Hlft0WrSbNsznz3HmJxLyDFcw24AlFTXIFEOqESg/KUlNK15dVmouuto3vbaA6XxyYVgyXcYABSwGTGW+aPDqBvJxpoddXQtVuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oWxRYols; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oWxRYols"
Received: by smtp.kernel.org (Postfix)
	id 6AA3EC4CEE3; Mon, 17 Mar 2025 16:16:12 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3A558C4CEED
	for <soc@kernel.org>; Mon, 17 Mar 2025 16:16:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3A558C4CEED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso16626945e9.0
        for <soc@kernel.org>; Mon, 17 Mar 2025 09:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742228169; x=1742832969; darn=kernel.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x1BZ14L05I3ekMDBepYo6Uyru8+RK3QutqbPs+6O6Dc=;
        b=oWxRYolseCFNbQUzQhlFr2R7NtUwSEHxriNIJT/jeyqPyKDM1s2eOtcGaFuPelIIQm
         Lw09FstQesS03iDz0mr0JMfCEPIfTPlXyryXTWt3uBQtHsbKZJ+nMsuOKAVGNVbJ9lXU
         fRWDGyMLWC4F3tJd0jpnNyCiOVjpByqARI5zb0NBLMaiSKsBfEdVsAUqLVfHorer8TJf
         W+eRhp7ua5wcybm9m7o08X9HkoB1vWoVjTkq48q9NjLgvxprXxyI8Po69UDwTKuhGnzV
         e7N2tnDPAtgSUWLZTtuJx0xDY+FZrbILVoVjouoCvHWwnwiCKZBtm8vWMe5DE6Xnsm0D
         826g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742228169; x=1742832969;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x1BZ14L05I3ekMDBepYo6Uyru8+RK3QutqbPs+6O6Dc=;
        b=HqVgsMKZRUoEQYksx4+GiNojx6DB/KyMeqI/JgPDsaRxTJsZx2ZEWbKW/CUh5tzAFb
         61I03xpby2JYua7nD9A52wiY0ITBjk4kR0WWb0/Tp/Ea4KMOmRfp1zhI+1Cv0IblPia/
         5E98H4l9+ND/KjnfBuNtm2bj88fhN0zugYwD1pRN5DbLD3V+dNwb08GH0PhIzbefuZcm
         1lPVMvYJOg1vI6nm6QxlLVfeU6LfWgiO+RNMGPMGFHKrK8rRiO4TwtB/22SCiGnFZiPg
         3spx7eSqvHUKy0fPqsWu6XeQflQBDAhg/ZosIeQM+5SWv1I/KuBWtd2P/jQUy42t4gKf
         /+kg==
X-Gm-Message-State: AOJu0YyDxvqGvqdpY77UENyVUPq1x4xnSWs7OKZi1ryWDuLKL3efD1U+
	lPig7PErb3nMHE/PNfb4BI5HO0vCq9OBoCYRJySsxhXoSVwmhjC8gWX+DGHyaFzo9CMn1dzLjEh
	k
X-Gm-Gg: ASbGncugtEmlvn6gLfVZOw+lv8OFscBvDMwgWirSMncsM332XHn0Ht1sR9k4z/gGNLg
	D5WfIj5txiL3mzRdnmSDGdCFBc+QDqcgtsYIu3qSSjijfy32S4jKsZAZHXT11f+jPcEOeqkn6aU
	llodT4hK5Ujl4Dx/aynQCaHQHuWj3/LPc3wdWnc6DmGFgUoukNsKJxGhGDCU2RrUCyNGbbsV5gl
	4N2uACZ24uEVggBPeoyRSw+uUa/2j+X7+Icz75ClNAexJDtJbwqMETlBJpEdlK8JaiQg4ubcoRu
	c4N37i8JrO8AFRbnD2g8sI4l5zjUP92+fCcUkfgLIf3OBH+q052iAKdh9MsdrHUGOV6BnyEZiH5
	11P30ZjfjDX3q5+0cbC8oPw==
X-Google-Smtp-Source: AGHT+IFWv27SmF7MzpnXo9R7iPDAj+6RqTUsIDH67v/ftmpxSj1WYnFVQKvecSP4MshBViBQNaeQDg==
X-Received: by 2002:a05:6000:178e:b0:38f:5057:5810 with SMTP id ffacd0b85a97d-3971decdc97mr17309093f8f.25.1742228169534;
        Mon, 17 Mar 2025 09:16:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:1a77:b55f:a550:458c? ([2a01:e0a:3d9:2080:1a77:b55f:a550:458c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3978ef9a23bsm11136752f8f.15.2025.03.17.09.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 09:16:09 -0700 (PDT)
Message-ID: <eeaa8d3b-4fc3-4dae-92b8-0fc590e1a070@linaro.org>
Date: Mon, 17 Mar 2025 17:16:08 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] Amlogic drivers updates for v6.15
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

Here's the GPIO interrupt controller bindings & driver, acked by Thomas to be
merged via the Amlogic tree along the DT changes.

Thanks,
Neil

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v6.15

for you to fetch changes up to bbd6fcc76b39502767e213ad24a349205cf75e96:

   irqchip: Add support for Amlogic A4 and A5 SoCs (2025-03-17 08:38:24 +0100)

----------------------------------------------------------------
Amlogic drivers changes for v6.15:
- GPIO interrupt controller support for Amlogic A4 and A5 SoCs

----------------------------------------------------------------
Xianwei Zhao (2):
       dt-bindings: interrupt-controller: Add support for Amlogic A4 and A5 SoCs
       irqchip: Add support for Amlogic A4 and A5 SoCs

  .../amlogic,meson-gpio-intc.yaml                   | 19 ++++++++-
  drivers/irqchip/irq-meson-gpio.c                   | 48 +++++++++++++++++-----
  2 files changed, 55 insertions(+), 12 deletions(-)
