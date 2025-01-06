Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F7C1487F4
	for <soc@lists.linux.dev>; Mon,  6 Jan 2025 14:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736173271; cv=none; b=RQYxoTBXua7O+ENiMnH6Jjcy1X0MoNNibjSwqhZK5N0MdHI9wtLi9tRVWglFmylfG6a7FEITTOQJHyN9vr2mFmldaZWaZvT8kcQOsVaWkhuiKATUCM/GycZdPYul5H5KFUGK5dZFTfNf7S6XVQsmV3Qk+BLz1hh2wnV940Qz17A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736173271; c=relaxed/simple;
	bh=3Y7++z3fyuW+gP8adVwRq4swMfYPkU1+pLV0+rHHyD4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=WuVWEbB8uRJUnqyxp5wIvlH1Cn8E+c+jsySY1dbqdcQAn8/pzT0Xg3jtbP4WLW34Eq4xWYO9ORHbEZg2Hl9QRr8vL30TTsLTuPT3UOlepDffRWIRZTwJZh8MQv/V6Y09/MQHT/ID9v0GYGNdcCVTiULqAfS6MpZGYH/AOSgqZxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wbmvgrho; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wbmvgrho"
Received: by smtp.kernel.org (Postfix)
	id 61B44C4CEE3; Mon,  6 Jan 2025 14:21:11 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4213EC4CED2
	for <soc@kernel.org>; Mon,  6 Jan 2025 14:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4213EC4CED2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso95897515e9.3
        for <soc@kernel.org>; Mon, 06 Jan 2025 06:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736173269; x=1736778069; darn=kernel.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oeHiTUaspxw3YHA9Av4He8MumgYB5Gh2jqQAtY0KVLI=;
        b=wbmvgrhoR5B5yBKShUR3jmxmcQnM96eaUtPHnyXLUTiwmDqDiHdBSPl68A1WiodG+O
         K7TSOl0dCXUhbs22Ko/IjfkmJQZ2Rkm3gpe3rNfcqBcvpxu4V3/1jGTWuYNUHyizs6n0
         E2x4vsYxMUAzKWhFR37UhOCSQySBBvXNDM0E3nlKwa13HwatOT65kyNJoIDHCZCrm0Gr
         zSGut7zpiIx98c4Y0Bl2oRLdoDBhyIpQsnClZKZEedb49dWT13QTLXBLvlCLZSrbMWWu
         Lwx1G7e6SjvqpKHN3/XSGMO3CkRCMRfZlkBi/ctbBHe4m0qPhRJd5JS2Eb3PQLfHzdWG
         6F+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736173269; x=1736778069;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oeHiTUaspxw3YHA9Av4He8MumgYB5Gh2jqQAtY0KVLI=;
        b=s1fmeVmmzK/D7lMv3nKSlorKBZSIXY0KUVHqm405Foua2FnYNW2tyNZu/TBTYWNIRd
         tCtdzDX2+BW9opjaknd0dx4TfZ1grT/GOTac5Ck6cR6fybVp5Rv3jN+wx7lbKqKLB1Ub
         sGwWYDCfgTsuAxsTrH+v8xVFmCE0f5ooTN0LQKccFdS5XqtBlsMb2yp9BEhLjGgbvQNi
         8yGfR8p9FML81ZymkvyFJhmh94bZS/fGbKOfN5VOigQsKqn/xzeWGRbTypBCMdkEijYz
         PL1AXQFv0RB6RWrnr9py8RRDb1OS1qppz45ZOqXDgSw9rAchFgtfjph4m+yncB7q2BZy
         XMCQ==
X-Gm-Message-State: AOJu0YyQM18hNfFqEiaIum0E9M0iE7GvGzPvnjcD0TEMyLDMLg6I0z7G
	jnZcGegNh9rNyBoTdM0gSti/GqrJ/iJJfnhHpsJZl2mRKiBGisS5kVPcRSLa4xqJlG/MBUdER02
	t
X-Gm-Gg: ASbGncvMIZEMhnggrVGGRxOBOd9z+WEBP9CKkTSV5Q48k90Qx/bTOqivwuQg+A1nHyL
	QjDwMCUiZX/LXOsNuPHGuLApxIZ/+gzp6keNTbk9wqeW/2gi7D6Py/9QuCZAbPmvFh/M/5NIrCo
	YgzPdgzPSchYOh+hHH5UFrcY/BpCkmt/O4aNIVbp9XXahm5wcQ8LfS0wxmVv2TQUTh3yjLYnRCG
	zuhlijY+MtqJKDc2wYygBuOXGVSlpExwZKz0A1sH8xeaesZe87kXKnqs3J86r5P8eSUXsvtTBnZ
	qlxGvhRF/YP4EbLDK5UrS0OQKRuL
X-Google-Smtp-Source: AGHT+IF5Lh+oWFRck0Vw/8+lvOoj6CBwPIpbpPWwc94r3tUU4OIFk9lTAnr5Rp6BiofrhtN1DtywvQ==
X-Received: by 2002:a05:600c:548e:b0:431:5e3c:2ff0 with SMTP id 5b1f17b1804b1-436686431a0mr463290275e9.8.1736173268595;
        Mon, 06 Jan 2025 06:21:08 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:95:e905:1421:811c? ([2a01:e0a:982:cbb0:95:e905:1421:811c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b11aecsm601987765e9.23.2025.01.06.06.21.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 06:21:08 -0800 (PST)
Message-ID: <77c645b3-0cdf-49f4-84e9-11c74074b9a8@linaro.org>
Date: Mon, 6 Jan 2025 15:21:07 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM DT updates for v6.14
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

Here's a single change for Amlogic ARM DT, simply removing size and address cells
from USB nodes when not needed.

Thanks,
Neil

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm-dt-for-v6.14

for you to fetch changes up to 3a4bb81850662bebab74f1ad27071652b1825d58:

   ARM: dts: amlogic: meson: remove size and address cells from USB nodes (2024-12-30 11:00:12 +0100)

----------------------------------------------------------------
Amlogic ARM DT changes for v6.14:
- remove size and address cells from USB nodes

----------------------------------------------------------------
Martin Blumenstingl (1):
       ARM: dts: amlogic: meson: remove size and address cells from USB nodes

  arch/arm/boot/dts/amlogic/meson.dtsi | 4 ----
  1 file changed, 4 deletions(-)
