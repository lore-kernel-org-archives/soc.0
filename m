Return-Path: <SRS0=ab8w=GL=huawei.com=jonathan.cameron@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3748DC433DB
	for <soc@archiver.kernel.org>; Fri,  8 Jan 2021 11:58:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E3B9B239FD; Fri,  8 Jan 2021 11:58:45 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A7422395B;
	Fri,  8 Jan 2021 11:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A7422395B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=Huawei.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=jonathan.cameron@huawei.com
Received: from fraeml710-chm.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4DC1lB5XGxz67Ysk;
	Fri,  8 Jan 2021 19:55:50 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml710-chm.china.huawei.com (10.206.15.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 8 Jan 2021 12:58:41 +0100
Received: from localhost (10.47.29.168) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2106.2; Fri, 8 Jan 2021
 11:58:40 +0000
Date: Fri, 8 Jan 2021 11:58:04 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
List-Id: <soc.lore.kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <soc@kernel.org>,
	<olof@lixom.net>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<arnd@arndb.de>
Subject: Re: [PATCH 01/10] soc: fujitsu: hwb: Add hardware barrier driver
 init/exit code
Message-ID: <20210108115804.00000594@Huawei.com>
In-Reply-To: <20210108103227.1740865-2-misono.tomohiro@jp.fujitsu.com>
References: <20210108103227.1740865-1-misono.tomohiro@jp.fujitsu.com>
	<20210108103227.1740865-2-misono.tomohiro@jp.fujitsu.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.29.168]
X-ClientProxiedBy: lhreml708-chm.china.huawei.com (10.201.108.57) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected

On Fri, 8 Jan 2021 19:32:18 +0900
Misono Tomohiro <misono.tomohiro@jp.fujitsu.com> wrote:

> This adds hardware barrier driver's struct definitions and
> module init/exit code. We use miscdeice for barrier driver ioctl

device

> and /dev/fujitsu_hwb will be created upon module load.
> Following commits will add each ioctl definition.
> 
> Signed-off-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>

Hi Misono,

I was taking a look out of curiosity so the following is definitely not
a full review but a few general comments inline.

Thanks,

Jonathan

> ---
>  drivers/soc/fujitsu/fujitsu_hwb.c | 313 ++++++++++++++++++++++++++++++
>  1 file changed, 313 insertions(+)
>  create mode 100644 drivers/soc/fujitsu/fujitsu_hwb.c
> 
> diff --git a/drivers/soc/fujitsu/fujitsu_hwb.c b/drivers/soc/fujitsu/fujitsu_hwb.c
> new file mode 100644
> index 000000000000..44c32c1683df
> --- /dev/null
> +++ b/drivers/soc/fujitsu/fujitsu_hwb.c
> @@ -0,0 +1,313 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2020 FUJITSU LIMITED
> + *
> + * This hardware barrier (HWB) driver provides a set of ioctls to realize synchronization
> + * by PEs in the same Come Memory Group (CMG) by using implementation defined registers.
> + * On A64FX, CMG is the same as L3 cache domain.
> + *
> + * The main purpose of the driver is setting up registers which cannot be accessed
> + * from EL0. However, after initialization, BST_SYNC/LBSY_SYNC registers which is used
> + * in synchronization main logic can be accessed from EL0 (therefore it is fast).
> + *
> + * Simplified barrier operation flow of user application is as follows:
> + *  (one PE)
> + *    1. Call IOC_BB_ALLOC to setup INIT_SYNC register which is shared in a CMG.
> + *       This specifies which PEs join synchronization
> + *  (on each PE joining synchronization)
> + *    2. Call IOC_BW_ASSIGN to setup ASSIGN_SYNC register per PE
> + *    3. Barrier main logic (all logic runs in EL0)
> + *      a) Write 1 to BST_SYNC register
> + *      b) Read LBSY_SYNC register
> + *      c) If LBSY_SYNC value is 1, sync is finished, otherwise go back to b
> + *         (If all PEs joining synchronization write 1 to BST_SYNC, LBSY_SYNC becomes 1)
> + *    4. Call IOC_BW_UNASSIGN to reset ASSIGN_SYNC register
> + *  (one PE)
> + *    5. Call IOC_BB_FREE to reset INIT_SYNC register
> + */
> +
> +#include <asm/cputype.h>
> +#include <linux/bitfield.h>
> +#include <linux/bitops.h>
> +#include <linux/cpu.h>
> +#include <linux/cpumask.h>
> +#include <linux/kernel.h>
> +#include <linux/miscdevice.h>
> +#include <linux/module.h>
> +#include <linux/spinlock.h>
> +#include <linux/slab.h>
> +#include <linux/wait.h>
> +
> +#ifdef pr_fmt
> +#undef pr_fmt
> +#endif
> +#define pr_fmt(fmt) "[%s:%s:%d] " fmt, KBUILD_MODNAME, __func__, __LINE__
> +
> +/* Since miscdevice is used, /dev/fujitsu_hwb will be created when module is loaded */
> +#define FHWB_DEV_NAME "fujitsu_hwb"
> +
> +/* Implementation defined registers for barrier shared in CMG */
> +#define FHWB_INIT_SYNC_BB0_EL1  sys_reg(3, 0, 15, 13, 0)
> +#define FHWB_INIT_SYNC_BB1_EL1  sys_reg(3, 0, 15, 13, 1)
> +#define FHWB_INIT_SYNC_BB2_EL1  sys_reg(3, 0, 15, 13, 2)
> +#define FHWB_INIT_SYNC_BB3_EL1  sys_reg(3, 0, 15, 13, 3)
> +#define FHWB_INIT_SYNC_BB4_EL1  sys_reg(3, 0, 15, 13, 4)
> +#define FHWB_INIT_SYNC_BB5_EL1  sys_reg(3, 0, 15, 13, 5)
> +
> +/* Implementation defined registers for barrier per PE */
> +#define FHWB_CTRL_EL1           sys_reg(3, 0, 11, 12, 0)
> +#define FHWB_BST_BIT_EL1        sys_reg(3, 0, 11, 12, 4)
> +#define FHWB_ASSIGN_SYNC_W0_EL1 sys_reg(3, 0, 15, 15, 0)
> +#define FHWB_ASSIGN_SYNC_W1_EL1 sys_reg(3, 0, 15, 15, 1)
> +#define FHWB_ASSIGN_SYNC_W2_EL1 sys_reg(3, 0, 15, 15, 2)
> +#define FHWB_ASSIGN_SYNC_W3_EL1 sys_reg(3, 0, 15, 15, 3)
> +
> +/* Field definitions for above registers */
> +#define FHWB_INIT_SYNC_BB_EL1_MASK_FIELD  GENMASK_ULL(44, 32)
> +#define FHWB_INIT_SYNC_BB_EL1_BST_FIELD   GENMASK_ULL(12, 0)
> +#define FHWB_CTRL_EL1_EL1AE               BIT_ULL(63)
> +#define FHWB_CTRL_EL1_EL0AE               BIT_ULL(62)
> +#define FHWB_BST_BIT_EL1_CMG_FILED        GENMASK_ULL(5, 4)
> +#define FHWB_BST_BIT_EL1_PE_FILED         GENMASK_ULL(3, 0)
> +#define FHWB_ASSIGN_SYNC_W_EL1_VALID      BIT_ULL(63)
> +
> +static enum cpuhp_state _hp_state;
> +
> +/*
> + * Each PE has its own CMG and Physical PE number (determined by BST_BIT_EL1 register).
> + * Barrier operation can be performed by PEs which belong to the same CMG.
> + */
> +struct pe_info {
> +	/* CMG number of this PE */
> +	u8 cmg;
> +	/* Physical PE number of this PE */
> +	u8 ppe;
> +};
> +
> +/* Hardware information of running system */
> +struct hwb_hwinfo {
> +	/* CPU type (part number) */
> +	unsigned int type;
> +	/* Number of CMG */
> +	u8 num_cmg;
> +	/* Number of barrier blade(BB) per CMG */
> +	u8 num_bb;
> +	/* Number of barrier window(BW) per PE */
> +	u8 num_bw;
> +	/*
> +	 * Maximum number of PE per CMG.
> +	 * Depending on BIOS configuration, each CMG has up to max_pe_per_cmg PEs
> +	 * and each PE has unique physical PE number between 0 ~ (max_pe_per_cmg-1)
> +	 */
> +	u8 max_pe_per_cmg;
> +
> +	/* Bitmap for currently allocated BB per CMG */
> +	unsigned long *used_bb_bmap;
> +	/* Bitmap for currently allocated BW per PE */
> +	unsigned long *used_bw_bmap;
> +	/* Mapping table of cpuid -> CMG/PE number */
> +	struct pe_info *core_map;
> +};
> +static struct hwb_hwinfo _hwinfo;
> +
> +/* List for barrier blade currently used per FD */
> +struct hwb_private_data {
> +	struct list_head bb_list;
> +	spinlock_t list_lock;
> +};
> +
> +/* Each barrier blade info */
> +#define BB_FREEING 1
> +struct bb_info {
> +	/* cpumask for PEs which participate synchronization */
> +	cpumask_var_t pemask;
> +	/* cpumask for PEs which currently assigned BW for this BB */
> +	cpumask_var_t assigned_pemask;
> +	/* Added to hwb_private_data::bb_list */
> +	struct list_head node;
> +	/* For indicating if this bb is currently being freed or not */
> +	unsigned long flag;
> +	/* For waiting ongoing assign/unassign operation to finish before freeing BB */
> +	wait_queue_head_t wq;
> +	/* Track ongoing assign/unassign operation count */
> +	atomic_t ongoing_assign_count;
> +	/* CMG  number of this blade */

nitpick: Double space currently after CMG that looks inconsistent.

> +	u8 cmg;
> +	/* BB number of this blade */
> +	u8 bb;
> +	/* Hold assigned window number of each PE corresponding to @assigned_pemask */
> +	u8 *bw;
> +	/* Track usage count as IOC_BB_FREE and IOC_BW_[UN]ASSIGN might be run in parallel */
> +	struct kref kref;
> +};
> +static struct kmem_cache *bb_info_cachep;
> +
> +static const struct file_operations fujitsu_hwb_dev_fops = {
> +	.owner          = THIS_MODULE,
> +};
> +
> +static struct miscdevice bar_miscdev = {
> +	.fops  = &fujitsu_hwb_dev_fops,
> +	.minor = MISC_DYNAMIC_MINOR,
> +	.mode  = 0666,
> +	.name  = FHWB_DEV_NAME,
> +};
> +
> +static void destroy_bb_info_cachep(void)
> +{
> +	kmem_cache_destroy(bb_info_cachep);
> +}
> +
> +static int __init init_bb_info_cachep(void)
> +{
> +	/*
> +	 * Since cpumask value will be copied from userspace to the beginning of
> +	 * struct bb_info, use kmem_cache_create_usercopy to mark that region.
> +	 * Otherwise CONFIG_HARDENED_USERCOPY gives user_copy_warn.
> +	 */
> +	bb_info_cachep = kmem_cache_create_usercopy("bb_info_cache", sizeof(struct bb_info),
> +			0, SLAB_HWCACHE_ALIGN, 0, sizeof(cpumask_var_t), NULL);
> +	if (bb_info_cachep == NULL)

inconsistent on ! vs == NULL checks.  I personally don't care which you use, but better to chose
one style and use if everywhere in a given driver.

> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
> +static void free_map(void)
> +{
> +	kfree(_hwinfo.used_bw_bmap);
> +	kfree(_hwinfo.used_bb_bmap);
> +	kfree(_hwinfo.core_map);
> +}
> +
> +static int __init alloc_map(void)

For generic sounding function names, it is better to prefix with something driver specific.
perhaps hwb_alloc_map() or similar?  Both avoids possible clashes of naming in future and
leads to more readable code as people then know the function is local.


> +{
> +	_hwinfo.core_map = kcalloc(num_possible_cpus(), sizeof(struct pe_info), GFP_KERNEL);

preferred to use sizeof(*_hwinfo.core_map) as saves reviewer checking the types.  Note
applies in other places as well.
Whilst it's nice to make these flexible in size, the separate allocations do add overheads.
Given num_possible_cpus is probably constrained, perhaps better to just make these fixed
size and big enough for all plausible usecases?


> +	_hwinfo.used_bb_bmap = kcalloc(_hwinfo.num_cmg, sizeof(unsigned long), GFP_KERNEL);
> +	_hwinfo.used_bw_bmap = kcalloc(num_possible_cpus(), sizeof(unsigned long), GFP_KERNEL);
> +	if (!_hwinfo.core_map || !_hwinfo.used_bb_bmap || !_hwinfo.used_bw_bmap)
> +		goto fail;

I'd prefer you check these individually and handle the frees explicitly.  Makes for easier reviewing
as we can match each fail against the clean up.

> +
> +	/* 0 is valid number for both CMG/PE. Set all bits to 1 to represents uninitialized state */
> +	memset(_hwinfo.core_map, 0xFF, sizeof(struct pe_info) * num_possible_cpus());
> +
> +	return 0;
> +
> +fail:
> +	free_map();
> +	return -ENOMEM;
> +}
> +
> +/* Get this system's CPU type (part number). If it is not fujitsu CPU, return -1 */
> +static int __init get_cpu_type(void)
> +{
> +	if (read_cpuid_implementor() != ARM_CPU_IMP_FUJITSU)
> +		return -1;

Better to return a meaningful error code from here, then pass it on at the caller.

> +
> +	return read_cpuid_part_number();
> +}
> +
> +static int __init setup_hwinfo(void)
> +{
> +	int type;
> +
> +	type = get_cpu_type();
> +	if (type < 0)

As above, I'd expect to see return type; here.

> +		return -ENODEV;
> +
> +	_hwinfo.type = type;
> +	switch (type) {
> +	case FUJITSU_CPU_PART_A64FX:
> +		_hwinfo.num_cmg = 4;
> +		_hwinfo.num_bb = 6;
> +		_hwinfo.num_bw = 4;
> +		_hwinfo.max_pe_per_cmg = 13;
> +		break;
> +	default:
> +		return -ENODEV;
> +	}
> +
> +	return 0;
> +}
> +
> +static int hwb_cpu_online(unsigned int cpu)
> +{
> +	u64 val;
> +	int i;
> +
> +	/* Setup core_map by reading BST_BIT_EL1 register of each PE */
> +	val = read_sysreg_s(FHWB_BST_BIT_EL1);
> +	_hwinfo.core_map[cpu].cmg = FIELD_GET(FHWB_BST_BIT_EL1_CMG_FILED, val);
> +	_hwinfo.core_map[cpu].ppe = FIELD_GET(FHWB_BST_BIT_EL1_PE_FILED, val);
> +
> +	/* Since these registers' values are UNKNOWN on reset, explicitly clear all */
> +	for (i = 0; i < _hwinfo.num_bw; i++)
> +		write_bw_reg(i, 0);
> +
> +	write_sysreg_s(0, FHWB_CTRL_EL1);
> +
> +	return 0;
> +}
> +
> +static int __init hwb_init(void)
> +{
> +	int ret;
> +
> +	ret = setup_hwinfo();
> +	if (ret < 0) {

As it's not obvious from the function name that the only thing it is doing is
checking the cpu type, I'd move this error print into that function call or
rename setup_hwinfo()


> +		pr_err("Unsupported CPU type\n");
> +		return ret;
> +	}
> +
> +	ret = alloc_map();
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = init_bb_info_cachep();
> +	if (ret < 0)
> +		goto out1;
> +
> +	/*
> +	 * Setup cpuhp callback to ensure each PE's resource will be initialized
> +	 * even if some PEs are offline at this point
> +	 */
> +	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "soc/fujitsu_hwb:online",
> +		hwb_cpu_online, NULL);
> +	if (ret < 0) {
> +		pr_err("cpuhp setup failed: %d\n", ret);
> +		goto out2;
> +	}
> +	_hp_state = ret;
> +
> +	ret = misc_register(&bar_miscdev);
> +	if (ret < 0) {
> +		pr_err("misc_register failed: %d\n", ret);
> +		goto out3;
> +	}
> +
> +	return 0;
> +
> +out3:
> +	cpuhp_remove_state(_hp_state);
> +out2:
> +	destroy_bb_info_cachep();
> +out1:
> +	free_map();
> +
> +	return ret;
> +}
> +
> +static void __exit hwb_exit(void)
> +{
> +	misc_deregister(&bar_miscdev);
> +	cpuhp_remove_state(_hp_state);
> +	destroy_bb_info_cachep();
> +	free_map();
> +}
> +
> +module_init(hwb_init);
> +module_exit(hwb_exit);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_AUTHOR("FUJITSU LIMITED");
> +MODULE_DESCRIPTION("FUJITSU HPC Hardware Barrier Driver");

