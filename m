Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A2432B98F
	for <soc@lists.linux.dev>; Thu, 22 Jan 2026 14:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769093827; cv=none; b=ZXH13ID+9qFwGzRaFVF4fGoKHplh6wxHieLUIN0HXmknrk5C6swqejkDCwpPoP3hTLBaJ5ZCeLGMwim+tXw7pJa/qwkMeD9msL5WI8bT+s7OZlXprJAdKXT6Y0R9P1HJM+I+5I+mfl4sspliGEI7wbV3jI9JdoArx/4Vqhb1YQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769093827; c=relaxed/simple;
	bh=Lmv0V7sGDXr/Y4d9IE52mPXKxa/BLpouN5uyFl4/+tg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=Gd87XCCekzwAxChoOUzG2Ywu77/ufwV75LNSEEr9loNgyClNqz3TqaYaBWfzlCry3CFqU764aU2pT7V7XJFBibUGGFElometffvD9IIo9SKIPaNwu7mYc12FU38lFbMdbmG9Ubpu+E+30Wqf3e7bQENKkCgiGApMjrVScmJVOfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bOjewCfa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bOjewCfa"
Received: by smtp.kernel.org (Postfix)
	id AF6BAC19422; Thu, 22 Jan 2026 14:57:06 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D9FADC116D0
	for <soc@kernel.org>; Thu, 22 Jan 2026 14:57:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D9FADC116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47d59da3d81so14800995e9.0
        for <soc@kernel.org>; Thu, 22 Jan 2026 06:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769093824; x=1769698624; darn=kernel.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vvvcAfpGr9iCX/eT3iVRIT3kqag1uOnz1TuyzDgPzzU=;
        b=bOjewCfa6bAvmV0fdkym2w5YQZtq+12QurgU/8ofsOY3SKKgA9Mge5bpgBb624H5a7
         ULSbxXEE4bQMfM7gLge/vaeRg6xUZhMkHqEq1wIFTNj4eHKh2lY3aSr2t1cqgKU9GECn
         kKy6jlIzVtCNk04U9ntQ/bnhJbzVDkjtpddd3yE1Olmz8NXZqrIWa4LDeAa7szBLsT9M
         8aIZ3zkalOhedsvnZtZRu4kwVb00IZV4mwtB9myPoaQptInzGu4VzLNsHzPZHXPLVfhN
         +cLiZYl9bxP2Y86cJJF/bD0TyLtjz8wHpY2PHu0o6vpnwJYJg1ipOUYeUQHsfG0jFR7j
         XcKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769093824; x=1769698624;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vvvcAfpGr9iCX/eT3iVRIT3kqag1uOnz1TuyzDgPzzU=;
        b=xCA8vognl85rKaMWt4jPlXKR4AVgqMViiONQHqn2Fn2oTJNInSdPBm7xa5+KCSMaCS
         s8QaL6Geq0N3h86NY6ib/QIp2fYARhB/6BKpUn8wKCobUkqThCacFceevk6oW+fnfNv2
         PjDwYv20wSszufv6inMhP9hfUymiSo7tJ0XcNQdagHINvDdivrlEv1YSCY3QLR6/1djU
         uFXIhAac/p2eKwU/73o9E+WEohDdmGbav0agwwTb5ysduZBN63nnPpN4wnZeJy/z69QE
         Yqj33Pybmz2EOdZYqTy/kxDXvFxTFQ+zttXnX+Brozus2TBZz2lpK0kKNTVLRT/T33Tk
         Rhnw==
X-Gm-Message-State: AOJu0YwEoSS8rt74YIQsnp0zZ3Nc/CLOhm+65uvwvBYxHJViQgX3AlGF
	lmQE2HvIcMn5i85BRm8mP1THg3O+/qNC12QN3MOq2RBllKJIc2YNL2hd7ndo2UlsmKGDSgcp0b3
	qJTYeh2nnkw==
X-Gm-Gg: AZuq6aJCg6DiH+568ZgdLFk+0eW0LgWOaAXf+NVszZyQQCCvEJaa4rh3sR6fKJIKBgg
	ijZq4vcuI0xZbVY8koAeLnKIxZtTX751tnDaSk5Q5VPCRR5UlujB0PrQqQgwBsq9QzMu4GGG3nA
	hVu73wfBvRzQ0i3AyN1+v/F6dwC/nQLMXrBra9lnpdAQcR7DPv9/I0OOI9HSEOStJZbIts8ZaiA
	B7pntmUFBhqTmEOK9b0AkI2X9215UYrGfGQbSpT0mzEdCF6f+wwlM6adDREaU8Wu2pCOPjm5tV6
	aKjncPI9lsCXEE9Vm/J4kfFhNyQ6q4tkaaSikllnCGhZVNDOVwlXi71LBfxmwTjLiX6Pf0V/CvB
	95dX+1H0YwOeX2X0+RshLpyCFVhsrfmyx8KNz/Byi6WNaMHQowkimLcaa9xwncxQqdApVwl7BXp
	4poPv9SjjrxhJgca6ts5p6JIGKCL1TNxHrH3a0iVP0rp9+1pacSM9ta47o7vWi+Hs=
X-Received: by 2002:a05:600c:3e06:b0:47e:e59c:67c5 with SMTP id 5b1f17b1804b1-48047073a08mr53424985e9.8.1769093824222;
        Thu, 22 Jan 2026 06:57:04 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:9dc7:6955:8850:f258? ([2a01:e0a:3d9:2080:9dc7:6955:8850:f258])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804704b712sm70427265e9.8.2026.01.22.06.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 06:57:03 -0800 (PST)
Message-ID: <1ded64e9-2154-4f4b-a9b3-3435a8f24078@linaro.org>
Date: Thu, 22 Jan 2026 15:57:03 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM DT updates for v6.20
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

Here's the Amlogic ARM DT changes for v6.20, with a single change dropping
usage of iio-hwmon in favour of generic-adc-thermal.

Thanks,
Neil

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm-dt-for-v6.20

for you to fetch changes up to 5ea75722eaec226c60472dc578a302aae1d1fa3e:

   ARM: dts: meson: drop iio-hwmon in favour of generic-adc-thermal (2026-01-07 15:02:40 +0100)

----------------------------------------------------------------
Amlogic ARM DT for v6.20:
- drop iio-hwmon in favour of generic-adc-thermal

----------------------------------------------------------------
Martin Blumenstingl (1):
       ARM: dts: meson: drop iio-hwmon in favour of generic-adc-thermal

  arch/arm/boot/dts/amlogic/meson.dtsi | 5 -----
  1 file changed, 5 deletions(-)
