Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FACEB64DC
	for <soc@archiver.kernel.org>; Mon, 17 Jul 2023 12:06:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 41CBFC433C9; Mon, 17 Jul 2023 12:06:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 198E1C433C7;
	Mon, 17 Jul 2023 12:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689595607;
	bh=8kAhdmLLNHB9doyGZkqOmneZEeUfLeR8MeMQhmEjB5Y=;
	h=Date:Subject:To:List-Id:Cc:References:From:In-Reply-To:From;
	b=AJ7hqwSDdPQrwQJbEPOUWaCUZtOvVVPBAlW06b5rHZxyX1GkFp5acvdeC9XM6bMXw
	 L20VbZUtDmp+rqdNt0UZuFLeUqKdxUllafwNteGRRsPkrTbjy/hT2o2UrTq4z7Y/sU
	 4xZowdf8VOlTJ1n1/VDZrz0E2OyX1ddXX9zdFHeJaeff8zky8Ezn/2xM2gjDUUE/NK
	 6vxJOTmPvMN03E8teQyIWWpavR0wK3os/378VWCuHDTYXaiX7N6zgnn3a1V7DeEYoO
	 qRHzs7vMS4Z1ORVNrP5kggOOuMS326C6jfi9IslJsd1fqlDU9LW/xlYmYz/Nz5Vp7N
	 lAaUSrTlcFwDQ==
Message-ID: <3e106062-9ceb-eb51-70ba-32734c769bd5@kernel.org>
Date: Mon, 17 Jul 2023 14:06:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 0/2] soc: hisilicon: Support HCCS driver on Kunpeng SoC
Content-Language: en-US
To: "lihuisong (C)" <lihuisong@huawei.com>, andersson@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 shawnguo@kernel.org, arnd@arndb.de, sudeep.holla@arm.com
List-Id: <soc.lore.kernel.org>
Cc: linux-kernel@vger.kernel.org, soc@kernel.org, wanghuiqiang@huawei.com,
 tanxiaofei@huawei.com, liuyonglong@huawei.com
References: <20230424073020.4039-1-lihuisong@huawei.com>
 <20230530112746.2767-1-lihuisong@huawei.com>
 <02f74b25-2ade-5b87-b316-ab902f08ead2@huawei.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <02f74b25-2ade-5b87-b316-ab902f08ead2@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/07/2023 08:17, lihuisong (C) wrote:
> Hi all,
> 
> Can you take a look at this series?

People you listed in "To:" field are not maintainers of HiSilicon, so
why pinging us?

HiSilicon DTS has numerous issues, so if you want to increase the
chances anyone cares about your patch, please contribute to fixing and
improving your company DTS. See for example commit b2bbc8687 which is
bad (underscores are not allowed) or 1860a51823 which is just wrong. The
latter one is being fixed, although I do not see the fix being picked
up... my feelings are the platform is just dead.

Best regards,
Krzysztof

