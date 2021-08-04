Return-Path: <SRS0=0Qs2=M3=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 612BCC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Aug 2021 15:27:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 294D060C3F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Aug 2021 15:27:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 294D060C3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VEMVlrhUxrDzAjWWPeYGAQTX3ynoaQJqYvks9PBt6oE=; b=yVdMV/hpbC7BzTeVX+505dmVgD
	U4tVEywT57JOWj8Z4Z8IiD63hGmj1fB36OGL6jRPxx6eDMUD1HYU4r5VrW+l5YFALL6ysoaG8iONT
	DH+UDFxHxWMDKVuRp2X0mTYRqWPHdaZXgNQSoqhuX1Ba9k3PYdqAYaW1afcovrr7mq7ZVlLjmtYBS
	DALcOIGk2feOSo/ZRk65TxaomVag8qoltnhMWTcqOeLcbS8Jh1nicOfLSPuvhRRhhyKgcq8oe8kPx
	ICXq33S3POsU+nhkB29fBY2Aipg8w4yQlHqpbuv5z67c0tRUo5CBLp/WsLo0jIhg9vYhjKrUV7w6n
	eqBejKlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBImT-006aHD-7E; Wed, 04 Aug 2021 15:26:05 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBImP-006aGT-0y
 for linux-arm-kernel@lists.infradead.org; Wed, 04 Aug 2021 15:26:03 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 174FLTf9002630; Wed, 4 Aug 2021 17:25:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=S9ert6QnYVEygDRWb10g0bL7/eEDQa3oDWEm42+oZ6s=;
 b=UylDzC2ymHe/7lMboKLJCiD1HFOUNh83+4hWNfiK7WpdZyR2CLuujZSu3XNrV6Tt3E3x
 BRCHQvGYH6//NI6qXtKNivNjXWnJnEbWXMBV9MMWmnisQNVNrqd72FeMZMztpnXsUR2z
 q9WwYQl2tLjcRD++azgWr32uv488g5j5ustfnpCg8oslT4bLzowgBJigY0hpoUiZ0uJb
 itPx53GK4gPzA8uUVdBpK/dE1QQx4K+fAyPENdUr1L09T03uWi9geaze7557Zz0ULtT0
 3wvUdUgQe1FhP5sU7eIDtrhL9T8kwT0tpXY69FiM7EBFtwI1ym9aVqs1JgtZUc99j7fq hw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3a7ruwskhb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Aug 2021 17:25:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 21AC410002A;
 Wed,  4 Aug 2021 17:25:46 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F178522D16E;
 Wed,  4 Aug 2021 17:25:45 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 4 Aug
 2021 17:25:45 +0200
Subject: Re: [PATCH 0/4] ARM: dts: sti: remove clk_ignore_unused from bootargs
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, SoC Team
 <soc@kernel.org>
References: <20210803124506.23365-1-patrice.chotard@foss.st.com>
 <CAK8P3a06_vUXghtvp4jTMEc4jV7RW8XmbUmgfrsoH_BSZ+awJQ@mail.gmail.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <09ee0256-5f51-513c-52f2-441e0e41aea9@foss.st.com>
Date: Wed, 4 Aug 2021 17:25:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a06_vUXghtvp4jTMEc4jV7RW8XmbUmgfrsoH_BSZ+awJQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-04_03:2021-08-04,
 2021-08-04 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_082601_564276_3B25CEE7 
X-CRM114-Status: GOOD (  24.09  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210804152545.v1msCPv1C5R2IWHPL362BpjZ79SCdgaGu5ff9NUtEKg@z>

Hi Arnd

On 8/4/21 3:50 PM, Arnd Bergmann wrote:
> On Tue, Aug 3, 2021 at 2:45 PM <patrice.chotard@foss.st.com> wrote:
>>
>> From: Patrice Chotard <patrice.chotard@foss.st.com>
>>
>> Remove clk_ignore_unused from bootargs from STi boards DT.
> 
> The patches look good to me, but I'm not sure what you expect me to do
> here, as you have added soc@kernel.org to Cc:, and other addresses to To:

Sorry, i wasn't aware that soc@kernel.org must only be used for pull request.

> 
> I have dropped them from patchwork for the moment. When you want
> them to be applied to the soc tree, please resend or send a pull request
> to:soc@kernel.org, until then, please leave out that address so it does
> not get into patchwork.
> 
>       Arnd
> 

Yes my intention is to submit a STi pull request with this patchset and another one.

Thanks
Patrice

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
