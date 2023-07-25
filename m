Return-Path: <SRS0=9iWC=DL=huawei.com=xuwei5@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8750C001DE
	for <soc@archiver.kernel.org>; Tue, 25 Jul 2023 08:59:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AB686C433C8; Tue, 25 Jul 2023 08:59:18 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A1530C433C7;
	Tue, 25 Jul 2023 08:59:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A1530C433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from kwepemi500011.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4R99sH2pD1zVjws;
	Tue, 25 Jul 2023 16:57:39 +0800 (CST)
Received: from [10.67.103.39] (10.67.103.39) by kwepemi500011.china.huawei.com
 (7.221.188.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 25 Jul
 2023 16:59:11 +0800
Message-ID: <64BF8EDE.7090304@hisilicon.com>
Date: Tue, 25 Jul 2023 16:59:10 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Huisong Li <lihuisong@huawei.com>, <arnd@arndb.de>, <krzk@kernel.org>,
	<sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <soc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <wanghuiqiang@huawei.com>,
	<tanxiaofei@huawei.com>, <liuyonglong@huawei.com>
Subject: Re: [PATCH RESEND v3 2/2] doc: soc: hisilicon: Add Kunpeng HCCS driver
 documentation
References: <20230424073020.4039-1-lihuisong@huawei.com> <20230725075706.48939-1-lihuisong@huawei.com> <20230725075706.48939-3-lihuisong@huawei.com>
In-Reply-To: <20230725075706.48939-3-lihuisong@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.103.39]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500011.china.huawei.com (7.221.188.124)
X-CFilter-Loop: Reflected

Hi Huisong,

On 2023/7/25 15:57, Huisong Li wrote:
> Document the sysfs attributes description provided by HCCS driver on
> Kunpeng SoC.
> 
> Signed-off-by: Huisong Li <lihuisong@huawei.com>
> ---
>  .../sysfs-devices-platform-kunpeng_hccs       | 76 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 77 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-devices-platform-kunpeng_hccs
> 
> diff --git a/Documentation/ABI/testing/sysfs-devices-platform-kunpeng_hccs b/Documentation/ABI/testing/sysfs-devices-platform-kunpeng_hccs
> new file mode 100644
> index 000000000000..83ebed801249
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-devices-platform-kunpeng_hccs
> @@ -0,0 +1,76 @@
> +What:		/sys/devices/platform/HISI04Bx:00/chipX/all_linked
> +		/sys/devices/platform/HISI04Bx:00/chipX/linked_full_lane
> +		/sys/devices/platform/HISI04Bx:00/chipX/crc_err_cnt
> +Date:		May 2023

Please update the date to "November 2023" to match the 6.6 kernel.

> +KernelVersion:	6.6
> +Contact:	Huisong Li <lihuisong@huawei.org>
> +Description:
> +		The /sys/devices/platform/HISI04Bx:00/chipX/ directory
> +		contains read-only attributes exposing some summarization
> +		information of all HCCS ports under a specified chip.
> +		The X in 'chipX' indicates the Xth chip on platform.
> +
> +		There are following attributes in this directory:
> +		================= ==== =========================================
> +		all_linked:       (RO) if all enabled ports on this chip are
> +				       linked (bool).
> +		linked_full_lane: (RO) if all linked ports on this chip are full
> +				       lane (bool).
> +		crc_err_cnt:      (RO) total CRC err count for all ports on this
> +				       chip.
> +		============= ==== =============================================
> +
> +What:		/sys/devices/platform/HISI04Bx:00/chipX/dieY/all_linked
> +		/sys/devices/platform/HISI04Bx:00/chipX/dieY/linked_full_lane
> +		/sys/devices/platform/HISI04Bx:00/chipX/dieY/crc_err_cnt
> +Date:		May 2023

Ditto.

> +KernelVersion:	6.6
> +Contact:	Huisong Li <lihuisong@huawei.org>
> +Description:
> +		The /sys/devices/platform/HISI04Bx:00/chipX/dieY/ directory
> +		contains read-only attributes exposing some summarization
> +		information of all HCCS ports under a specified die.
> +		The Y in 'dieY' indicates the hardware id of the die on chip who
> +		has chip id X.
> +
> +		There are following attributes in this directory:
> +		================= ==== =========================================
> +		all_linked:       (RO) if all enabled ports on this die are
> +				       linked (bool).
> +		linked_full_lane: (RO) if all linked ports on this die are full
> +				       lane (bool).
> +		crc_err_cnt:      (RO) total CRC err count for all ports on this
> +				       die.
> +		============= ==== =============================================
> +
> +What:		/sys/devices/platform/HISI04Bx:00/chipX/dieY/hccsN/type
> +		/sys/devices/platform/HISI04Bx:00/chipX/dieY/hccsN/lane_mode
> +		/sys/devices/platform/HISI04Bx:00/chipX/dieY/hccsN/enable
> +		/sys/devices/platform/HISI04Bx:00/chipX/dieY/hccsN/cur_lane_num
> +		/sys/devices/platform/HISI04Bx:00/chipX/dieY/hccsN/lane_mask
> +		/sys/devices/platform/HISI04Bx:00/chipX/dieY/hccsN/crc_err_cnt
> +Date:		May 2023

Ditto.

Best Regards,
Wei

> +KernelVersion:	6.6
> +Contact:	Huisong Li <lihuisong@huawei.org>
> +Description:
> +		The /sys/devices/platform/HISI04Bx/chipX/dieX/hccsN/ directory
> +		contains read-only attributes exposing information about
> +		a HCCS port. The N value in 'hccsN' indicates this port id.
> +		The X in 'chipX' indicates the ID of the chip to which the
> +		HCCS port belongs. For example, X ranges from to 'n - 1' if the
> +		chip number on platform is n.
> +		The Y in 'dieY' indicates the hardware id of the die to which
> +		the hccs port belongs.
> +
> +		The HCCS port have the following attributes:
> +		============= ==== =============================================
> +		type:         (RO) port type (string), e.g. HCCS-v1 -> H32
> +		lane_mode:    (RO) the lane mode of this port (string), e.g. x8
> +		enable:       (RO) indicate if this port is enabled (bool).
> +		cur_lane_num: (RO) current lane number of this port.
> +		lane_mask:    (RO) current lane mask of this port, every bit
> +			           indicates a lane.
> +		crc_err_cnt:  (RO) CRC err count on this port.
> +		============= ==== =============================================
> +		Note: type, lane_mode and enable are fixed attributes on
> +		      running platform.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4e55ff992171..7a34bab232eb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9474,6 +9474,7 @@ F:	drivers/crypto/hisilicon/zip/
>  HISILICON KUNPENG SOC HCCS DRIVER
>  M:	Huisong Li <lihuisong@huawei.com>
>  S:	Maintained
> +F:	Documentation/ABI/testing/sysfs-devices-platform-kunpeng_hccs
>  F:	drivers/soc/hisilicon/kunpeng_hccs.c
>  F:	drivers/soc/hisilicon/kunpeng_hccs.h
>  
> 
