Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646A431E823
	for <soc@lists.linux.dev>; Tue,  6 Oct 2026 11:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791284501; cv=pass; b=ZzxhO5UVWzZRSmob9Lvxkf9jOGsjziZDzH77DmlIKHDx3/nr9l1wvzHJ10WmZVXhfTvLISqWMfjaKs+mtXqOz0kwJZFjBi1kYyv2D0R/nD6Fo1lYIFi0AaLV2Y/rFyQuwss2S8gVlaRPDSmtSaxcpeeCwPkWyo4ST1iaYvhWd6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791284501; c=relaxed/simple;
	bh=QNMHBtWz9xIlORTTPTS3/58TfVLA6dBZn2rTH5KNvtY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=KN38D1p9PJREufG7y52LdVtrh4Vr6JvmH9+3taB09ih8DiMDXonT+ny61lxXPNfnoe3w7kiGLxDL1kIGutwzuQEQlcUfh6S79ZJNdPdg02/UpvMO0XiEJFvzQBp0D/WQydUglaDV6I7r9j7OckIqZQKjd3CG7M356DP6JKY1gcc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fkm9Dxbh; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fkm9Dxbh"
Received: by smtp.kernel.org (Postfix)
	id DE94C1F00893; Tue,  6 Oct 2026 11:01:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791284499;
	b=PKy+o/XyxUWegcKa6hbd98Ms5r0Fzs13JsNXPAxVf/4sJnbKSs1hLGsg35Y0JxLGckKV
	 EoFs1nj1WA7HrpyQlC9WhD/B06ivn18u8ph064inMvHGJj4Eg/WJ2Ei0wyuGWNaho5Pb7
	 K84CKJEzHMWmQ7g9b/d7Y4DYu/5wAnbWJFGrUSKzQYJTZJru8mpZko+AE1DsxSd4TaB7J
	 qjeGJoPB+pGg3BiYFmF9P0adJktRnyL4efeEvHKNruG8C0gc19QyZ7iEJ7Q1XCFMoN7Cf
	 eWMPiHy96PT4gyoJJL68E3x11wqa1HJYIE4wvZ+JsCb8unSYLlWulTbsE/Ep8fJy+Lg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791284499;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Subject:Reply-To:To:Cc:Content-Language:
	 Autocrypt:Organization:Content-Type:Content-Transfer-Encoding;
	bh=dV0RSoFV6Y+3amLPhBXn9ZC7bZtBE6S7E5l+wTKLQOM=;
	b=eXSIy7ogI20lWvEUaju2KL1Zwfbu3Rw3vKwE3tzr50KFKwgRYYt3/zm4GDlHAA0uKnkL
	 7SBEkDl9RSVdZ3t2efBErleGq2cOrO5xHv0PziEUzkS8dlAGWDvbJZbJI8KVGhpb2ZJGC
	 VJKpEMkIXaMfizwl+mHchabZr8YUuucPdaSHQC/wFmk5Z567BAcQjPH3w8vqsW422O75X
	 kMgwnIpEyW80o/AHsyHCcWGg75CJTk5jiV+V2FAhILPf6QMmaG0VFhbkmgrUgueZR8Mg4
	 2Qmn1DMg5BF+jjUsNvzw4vdvAQ04qSY7JeG8jhzuE6IznTU6OnoVW4+r8R+9QNAHDBQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Fkm9Dxbh;
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5DF061F000FF
	for <soc@kernel.org>; Tue,  6 Oct 2026 11:01:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Fkm9Dxbh
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 5DF061F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso7030275e9.0
        for <soc@kernel.org>; Tue, 06 Oct 2026 04:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791284498; x=1791889298; darn=kernel.org;
        h=content-transfer-encoding:content-type:organization:autocrypt
         :content-language:cc:to:reply-to:subject:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dV0RSoFV6Y+3amLPhBXn9ZC7bZtBE6S7E5l+wTKLQOM=;
        b=Fkm9DxbhcEbRjtIVe26Qbu67WB0GqQYHtSYnnyOwyjUdggcoQN7xQv7WMISGf6ZDtS
         COPaxIBW42bi0zTQHqlj6YyaN49K7x7wvQI8g6mU0Mht7bGLRuDaOBWSovaj4hSxkdYL
         6ZShpF5USHPco6e8LcEVK97PiJmb0cYtZ9pS8WyvnHRPIinAU3F1rASQOeA46GEmo8NF
         FcxC57SWJaa0oBGIsPV3weRDviHBpfPXqWhNIlCuanMWbbJjp8flMGBbsClNWBW8fI+U
         YboDQWzRvxuNQhjr04DkvUe41QewTvuLTTa4rqHMCcsGw7hDsmhaJzSpGN0lT1BWnxKO
         mLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791284498; x=1791889298;
        h=content-transfer-encoding:content-type:organization:autocrypt
         :content-language:cc:to:reply-to:subject:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dV0RSoFV6Y+3amLPhBXn9ZC7bZtBE6S7E5l+wTKLQOM=;
        b=Z0wJjqHtyiLvzaqqxm549UnZWuNq5uH1SEw1eiEtzx0VnBE7RsXZFsFYLu/ehbRN8L
         5+aw7mhLT+pOQxE6OsDmzAiyXU2Ik9IP+wAjenkb2SejXXeZDJUiK1+nXwNJFiXVH6pp
         1s3Ktj2cXUJePoz4xHgpNhxsnm+aLUPECY+Fh7cHktaCbq/Jr5D4mYFjitZX8TsmWzKo
         /csJGI1wn4EUgPRdcsuF7ktf0cmAxayvD6PARzNLcihD9cdmGn7i9LO6uJoCdZBK9GUe
         nKhzH67PDFjtqfn26Vo2TXvKsZ4cVszrDJpoWLESnFoZ4Thyt5J0+07d0O5KroRaj9D0
         6UZw==
X-Gm-Message-State: AFuF++l2mzKjubjWXNUCACpwi93etlEJXg4gu4y0JU0oB2POUOya/svv
	FVPGn+PmUPxAikvCX3VefMM5oUL2pjLG3A4wor8wtHNC/Coz7wnPco4mSK5sLt9eohAqGhudEiK
	/JzTLDgijtg==
X-Gm-Gg: AYBFou3ys1d3xRA9ywaCeZFr1AwpN6999pam7hO0ks7n9bJ0ubIKNiobjOTYyQoW/WB
	tntETAGmj19sOI1FsH9VCikQD4zsbWWGUCDTR/IJbER0uz8IOC5oW6gT7m0YauAW/IeLWnSELSv
	ISBsVL1Q8Mp2qahBtnw0B79azjKxjhXdD3Xe37TgGMv6/iBnyfEx0kAZTRp+63aGW6dn/1ME10v
	6/dHLXgmgSYoEyBxbYyXiafmMkWslMZ6J1Ru7aF+lylUS7uNnlH5IV4yUN0Ej3lSaGrmcLlWesp
	H/wpDCtja8eEOW8y0i3zci6SXs3tq3FnDVu2IjGiugCeH8sTaGEp1DI5edP6Ykw68zfkwGn9Gb9
	CrFLQAcVZ/63YhitzhwT80SdIanGYc/Uzq2UYxJKN19BqeSQqKQI85UrPbXkCjilos3BP8ukTww
	jHij0Vwm389m9nx2tWBoKuaXhxG9KibnCVH9peDY7exrqHJYzlfHaDI6s0FeMNgXwzbtx7DfqqJ
	fkGZpGftYTOE5TG92oQYXJXuzE7LEAp
X-Received: by 2002:a05:600c:6046:b0:4a0:321:6dad with SMTP id 5b1f17b1804b1-4a178a396c1mr32243445e9.16.1791284495071;
        Tue, 06 Oct 2026 04:01:35 -0700 (PDT)
Received: from [192.168.151.96] (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6cd7c326sm2508351f8f.53.2026.10.06.04.01.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 04:01:33 -0700 (PDT)
Message-ID: <a1f0aa7d-be6b-4229-8345-66595a47be74@linaro.org>
Date: Tue, 6 Oct 2026 13:01:29 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] Amlogic drivers updates for v7.4
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

Here's drivers updates for Amlogic SoCs for v7.4, mainly clock measure
support for Amlogic a4/a5/s7/s7d/s6/a9.

Thanks,
Neil

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v7.4

for you to fetch changes up to a848d72aab71e19ea78180f2502ad7d12818723f:

   soc: amlogic: clk-measure: Optimize CLK_MSR_ID to reduce memory usage (2026-10-02 11:24:25 +0200)

----------------------------------------------------------------
Amlogic drivers for v7.4:
- Clock measure bindings reorg
- Clock measure support for Amlogic a4/a5/s7/s7d/s6/a9
- Clock mesure memory optimization

----------------------------------------------------------------
Chuan Liu (6):
       dt-bindings: soc: amlogic: Reordering compatible of clk-measure
       dt-bindings: soc: amlogic: Add clk-measure compatible to support more SoCs
       soc: amlogic: clk-measure: Support more measurement channels
       soc: amlogic: clk-measure: Align compatible entries with DT bindings
       soc: amlogic: clk-measure: Add support for more SoCs
       soc: amlogic: clk-measure: Optimize CLK_MSR_ID to reduce memory usage

  .../soc/amlogic/amlogic,meson-gx-clk-measure.yaml  |  16 +-
  drivers/soc/amlogic/meson-clk-measure.c            | 927 ++++++++++++++++++++-
  2 files changed, 923 insertions(+), 20 deletions(-)
